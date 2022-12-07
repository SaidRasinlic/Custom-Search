// Entry point for the build script in your package.json
import "chartkick/chart.js"
import { startRender } from './renderData';
import { startSearchAlgo } from './search';

startSearchAlgo();
startRender();