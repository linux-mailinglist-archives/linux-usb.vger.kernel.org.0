Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3411165C2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 05:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfLIEIi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Dec 2019 23:08:38 -0500
Received: from mga03.intel.com ([134.134.136.65]:20803 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726834AbfLIEIi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 8 Dec 2019 23:08:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Dec 2019 20:08:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="244312348"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2019 20:08:37 -0800
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 8 Dec 2019 20:08:37 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 8 Dec 2019 20:08:36 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.109]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.29]) with mapi id 14.03.0439.000;
 Mon, 9 Dec 2019 12:08:35 +0800
From:   "Yuan, Shengquan" <shengquan.yuan@intel.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Question for usbmon/SET_ADDRESS request
Thread-Topic: Question for usbmon/SET_ADDRESS request
Thread-Index: AdWuRcnxiBS1b5xIR76NSftKb1T3Rg==
Date:   Mon, 9 Dec 2019 04:08:34 +0000
Message-ID: <47EE7DDB963B974E8D97CE7497B454D43FED8BE2@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkkgdHJpZWQgdG8gdXNlIHVzYm1vbiB0byBjYXB0dXJlIHRoZSBVU0IgcGFja2V0cyB3
aGVuIGluc2VydGluZyBhIHUtZGlzaywgaG93ZXZlciwgSSBkaWRuJ3Qgc2VlIHRoZSBTRVRfQURE
UkVTUyByZXF1ZXN0DQoNCkJlbG93IGlzIHRoZSBwYWNrZXQgbGlzdCwgIGluIHBhY2tldCA4OCwg
dGhlIGhvc3Qgc3VkZGVubHkgdXNlcyBhZGRyZXNzIDc0IHRvIGNvbW11bmljYXRlIHdpdGggVS1k
aXNrLiAgSSBhbSB3b25kZXJpbmcgd2hldGhlciB1c2Jtb24gd2lsbCBjYXB0dXJlIFNFVF9BRERS
RVNTIHJlcXVlc3Q/DQoNCjcxCTguNDYzNTE0CWhvc3QJMS4xLjEJVVNCCTY0CVVSQl9JTlRFUlJV
UFQgaW4NCjcyCTguNDYzNTM2CWhvc3QJMS4xLjAJVVNCSFVCCTY0CUdFVF9TVEFUVVMgUmVxdWVz
dCAgICAgW1BvcnQgNl0NCjczCTguNDYzNTUzCTEuMS4wCWhvc3QJVVNCSFVCCTY4CUdFVF9TVEFU
VVMgUmVzcG9uc2UgICAgW1BvcnQgNl0NCjc0CTguNDYzNjEzCWhvc3QJMS4xLjAJVVNCSFVCCTY0
CVNFVF9GRUFUVVJFIFJlcXVlc3QgICAgW1BvcnQgNjogUE9SVF9SRVNFVF0NCjc1CTguNDYzNjI2
CTEuMS4wCWhvc3QJVVNCSFVCCTY0CVNFVF9GRUFUVVJFIFJlc3BvbnNlICAgW1BvcnQgNjogUE9S
VF9SRVNFVF0NCjc2CTguNTIzNDY5CWhvc3QJMS4xLjAJVVNCSFVCCTY0CUdFVF9TVEFUVVMgUmVx
dWVzdCAgICAgW1BvcnQgNl0NCjc3CTguNTIzNDg3CTEuMS4wCWhvc3QJVVNCSFVCCTY4CUdFVF9T
VEFUVVMgUmVzcG9uc2UgICAgW1BvcnQgNl0NCjc4CTguNTIzNDk1CWhvc3QJMS4xLjAJVVNCSFVC
CTY0CUNMRUFSX0ZFQVRVUkUgUmVxdWVzdCAgW1BvcnQgNjogQ19QT1JUX1JFU0VUXQ0KNzkJOC41
MjM1MDEJMS4xLjAJaG9zdAlVU0JIVUIJNjQJQ0xFQVJfRkVBVFVSRSBSZXNwb25zZSBbUG9ydCA2
OiBDX1BPUlRfUkVTRVRdDQo4MAk4LjU4MzY5MAlob3N0CTEuMC4wCVVTQgk2NAlHRVQgREVTQ1JJ
UFRPUiBSZXF1ZXN0IERFVklDRQ0KODEJOC41ODM3ODEJMS4wLjAJaG9zdAlVU0IJODIJR0VUIERF
U0NSSVBUT1IgUmVzcG9uc2UgREVWSUNFDQo4Mgk4LjU4MzgyMAlob3N0CTEuMS4wCVVTQkhVQgk2
NAlTRVRfRkVBVFVSRSBSZXF1ZXN0ICAgIFtQb3J0IDY6IFBPUlRfUkVTRVRdDQo4Mwk4LjU4Mzgz
NwkxLjEuMAlob3N0CVVTQkhVQgk2NAlTRVRfRkVBVFVSRSBSZXNwb25zZSAgIFtQb3J0IDY6IFBP
UlRfUkVTRVRdDQo4NAk4LjY0MzY0Mwlob3N0CTEuMS4wCVVTQkhVQgk2NAlHRVRfU1RBVFVTIFJl
cXVlc3QgICAgIFtQb3J0IDZdDQo4NQk4LjY0MzY2NgkxLjEuMAlob3N0CVVTQkhVQgk2OAlHRVRf
U1RBVFVTIFJlc3BvbnNlICAgIFtQb3J0IDZdDQo4Ngk4LjY0MzY3NQlob3N0CTEuMS4wCVVTQkhV
Qgk2NAlDTEVBUl9GRUFUVVJFIFJlcXVlc3QgIFtQb3J0IDY6IENfUE9SVF9SRVNFVF0NCjg3CTgu
NjQzNjgwCTEuMS4wCWhvc3QJVVNCSFVCCTY0CUNMRUFSX0ZFQVRVUkUgUmVzcG9uc2UgW1BvcnQg
NjogQ19QT1JUX1JFU0VUXQ0KODgJOC43MjM1NTgJaG9zdAkxLjc0LjAJVVNCCTY0CUdFVCBERVND
UklQVE9SIFJlcXVlc3QgREVWSUNFDQo4OQk4LjcyMzY1MAkxLjc0LjAJaG9zdAlVU0IJODIJR0VU
IERFU0NSSVBUT1IgUmVzcG9uc2UgREVWSUNFDQo5MAk4LjcyMzY5Mglob3N0CTEuNzQuMAlVU0IJ
NjQJR0VUIERFU0NSSVBUT1IgUmVxdWVzdCBCT1MNCg0KVGhhbmtzDQotQXVzdGluDQo=
