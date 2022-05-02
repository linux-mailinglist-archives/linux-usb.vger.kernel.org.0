Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6415177C3
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 22:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347604AbiEBUMK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 16:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387257AbiEBUMB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 16:12:01 -0400
Received: from m13123.mail.163.com (m13123.mail.163.com [220.181.13.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EEC8ABCB2
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 13:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=o/+Es
        28ZZz9ebTEF2zfcp05oljhkyKKFyf6y/aIyItc=; b=AdkFnr7VXvvzv48G7vOy6
        tEU2KKmcuLVUPe+COyQxAN6ZcFJaG/JkeTqbiuffdQwxbOWj9w9dqWUhvfnlZYqE
        wcucmer5IwlhG00OXnk2zuBG7cGD3lL8VcW0RviRVU418wZCHJhhyQTD0JRAPMd5
        HpJbAewX0fFM8ZctmArreA=
Received: from yxj790222$163.com ( [124.126.178.177] ) by
 ajax-webmail-wmsvr123 (Coremail) ; Tue, 3 May 2022 04:07:38 +0800 (CST)
X-Originating-IP: [124.126.178.177]
Date:   Tue, 3 May 2022 04:07:38 +0800 (CST)
From:   =?UTF-8?B?5bCk5pmT5p2w?= <yxj790222@163.com>
To:     "Alan Stern" <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re:Re: Re: BUG report: ohci-pci ehci-pci , newer nec chip failed
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <YnAzjG+wU0yCI29O@rowland.harvard.edu>
References: <2b564264.1963.18084f0e7a6.Coremail.yxj790222@163.com>
 <Ym/s33/hFybb2JfH@rowland.harvard.edu>
 <1582a60e.34.1808632ac75.Coremail.yxj790222@163.com>
 <YnAzjG+wU0yCI29O@rowland.harvard.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4e2276ec.63.1808662b754.Coremail.yxj790222@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: e8GowADX348KOnBi7xghAA--.49462W
X-CM-SenderInfo: 510mlmaqssjqqrwthudrp/xtbB0Rb0vFzIAbIb+QABsL
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Cgp5ZXMsIHRoaXMgbGluZSBpcyBzdHJhbmdlICwgbm9uZSBpL28gbm9uZSBtZW0sIHNvbWV0aGlu
ZyB3cm9uZy4gb25seSBvaGNpLgoKCgowNjowMC4wIFVTQiBjb250cm9sbGVyOiBORUMgQ29ycG9y
YXRpb24gT0hDSSBVU0IgQ29udHJvbGxlciAocmV2IDQ0KSAocHJvZy1pZiAxMCBbT0hDSV0pCsKg
wqAgwqBTdWJzeXN0ZW06IE5FQyBDb3Jwb3JhdGlvbiBVU0IgQ29udHJvbGxlcgrCoMKgIMKgQ29u
dHJvbDogSS9PLSBNZW0tIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBNZW1XSU5WLSBWR0FTbm9vcC0g
UGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlzSU5UeC0KwqDCoCDCoFN0YXR1czog
Q2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJFcnItIERFVlNFTD1tZWRpdW0gPlRBYm9ydC0g
PFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJTlR4LQrCoMKgIMKgSW50ZXJydXB0OiBw
aW4gQSByb3V0ZWQgdG8gSVJRIDIyCsKgwqAgwqBSZWdpb24gMDogTWVtb3J5IGF0IGEwMDAwMDAw
ICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFt2aXJ0dWFsXSBbc2l6ZT00S10KwqDCoCDCoENh
cGFiaWxpdGllczogW2ZjXSBOdWxsCsKgwqAgwqBLZXJuZWwgbW9kdWxlczogb2hjaV9wY2kKCjA2
OjAwLjEgVVNCIGNvbnRyb2xsZXI6IE5FQyBDb3Jwb3JhdGlvbiB1UEQ3MjAxMHggVVNCIDIuMCBD
b250cm9sbGVyIChyZXYgMDUpIChwcm9nLWlmIDIwIFtFSENJXSkKwqDCoCDCoFN1YnN5c3RlbTog
TkVDIENvcnBvcmF0aW9uIHVQRDcyMDEweCBVU0IgMi4wIENvbnRyb2xsZXIKwqDCoCDCoENvbnRy
b2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXItIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBh
ckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtCsKgwqAgwqBTdGF0dXM6IENh
cCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9bWVkaXVtID5UQWJvcnQtIDxU
QWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0KwqDCoCDCoEludGVycnVwdDogcGlu
IEEgcm91dGVkIHRvIElSUSAyMgrCoMKgIMKgUmVnaW9uIDA6IE1lbW9yeSBhdCBhMDAwMTAwMCAo
MzItYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbdmlydHVhbF0gW3NpemU9MjU2XQrCoMKgIMKgQ2Fw
YWJpbGl0aWVzOiBbZmNdIE51bGwKwqDCoCDCoEtlcm5lbCBtb2R1bGVzOiBlaGNpX3BjaQoKCgpj
b21wYXJlZCB3aXRoIG9sZCBjaGlwCgoKMDY6MDAuMCBVU0IgY29udHJvbGxlcjogTkVDIENvcnBv
cmF0aW9uIE9IQ0kgVVNCIENvbnRyb2xsZXIgKHJldiA0MykgKHByb2ctaWYgMTAgW09IQ0ldKQrC
oMKgIMKgU3Vic3lzdGVtOiBBZGFwdGVjIE9IQ0kgVVNCIENvbnRyb2xsZXIKwqDCoCDCoENvbnRy
b2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXIrIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBh
ckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtCsKgwqAgwqBTdGF0dXM6IENh
cCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9bWVkaXVtID5UQWJvcnQtIDxU
QWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0KwqDCoCDCoExhdGVuY3k6IDY0ICgy
NTBucyBtaW4sIDEwNTAwbnMgbWF4KSwgQ2FjaGUgTGluZSBTaXplOiAzMiBieXRlcwrCoMKgIMKg
SW50ZXJydXB0OiBwaW4gQSByb3V0ZWQgdG8gSVJRIDIyCsKgwqAgwqBSZWdpb24gMDogTWVtb3J5
IGF0IGEwMDAwMDAwICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPTRLXQrCoMKgIMKg
Q2FwYWJpbGl0aWVzOiBbNDBdIFBvd2VyIE1hbmFnZW1lbnQgdmVyc2lvbiAyCsKgwqAgwqDCoMKg
wqAgRmxhZ3M6IFBNRUNsay0gRFNJLSBEMSsgRDIrIEF1eEN1cnJlbnQ9MG1BIFBNRShEMCssRDEr
LEQyKyxEM2hvdCssRDNjb2xkLSkKwqDCoCDCoMKgwqDCoCBTdGF0dXM6IEQwIE5vU29mdFJzdC0g
UE1FLUVuYWJsZS0gRFNlbD0wIERTY2FsZT0wIFBNRSsKwqDCoCDCoEtlcm5lbCBkcml2ZXIgaW4g
dXNlOiBvaGNpLXBjaQrCoMKgIMKgS2VybmVsIG1vZHVsZXM6IG9oY2lfcGNpCgowNjowMC4xIFVT
QiBjb250cm9sbGVyOiBORUMgQ29ycG9yYXRpb24gT0hDSSBVU0IgQ29udHJvbGxlciAocmV2IDQz
KSAocHJvZy1pZiAxMCBbT0hDSV0pCsKgwqAgwqBTdWJzeXN0ZW06IEFkYXB0ZWMgT0hDSSBVU0Ig
Q29udHJvbGxlcgrCoMKgIMKgQ29udHJvbDogSS9PLSBNZW0rIEJ1c01hc3RlcisgU3BlY0N5Y2xl
LSBNZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlz
SU5UeC0KwqDCoCDCoFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJFcnItIERF
VlNFTD1tZWRpdW0gPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJTlR4
LQrCoMKgIMKgTGF0ZW5jeTogNjQgKDI1MG5zIG1pbiwgMTA1MDBucyBtYXgpLCBDYWNoZSBMaW5l
IFNpemU6IDMyIGJ5dGVzCsKgwqAgwqBJbnRlcnJ1cHQ6IHBpbiBCIHJvdXRlZCB0byBJUlEgMjIK
wqDCoCDCoFJlZ2lvbiAwOiBNZW1vcnkgYXQgYTAwMDEwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNo
YWJsZSkgW3NpemU9NEtdCsKgwqAgwqBDYXBhYmlsaXRpZXM6IFs0MF0gUG93ZXIgTWFuYWdlbWVu
dCB2ZXJzaW9uIDIKwqDCoCDCoMKgwqDCoCBGbGFnczogUE1FQ2xrLSBEU0ktIEQxKyBEMisgQXV4
Q3VycmVudD0wbUEgUE1FKEQwKyxEMSssRDIrLEQzaG90KyxEM2NvbGQtKQrCoMKgIMKgwqDCoMKg
IFN0YXR1czogRDAgTm9Tb2Z0UnN0LSBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FKwrC
oMKgIMKgS2VybmVsIGRyaXZlciBpbiB1c2U6IG9oY2ktcGNpCsKgwqAgwqBLZXJuZWwgbW9kdWxl
czogb2hjaV9wY2kKCjA2OjAwLjIgVVNCIGNvbnRyb2xsZXI6IE5FQyBDb3Jwb3JhdGlvbiB1UEQ3
MjAxMHggVVNCIDIuMCBDb250cm9sbGVyIChyZXYgMDQpIChwcm9nLWlmIDIwIFtFSENJXSkKwqDC
oCDCoFN1YnN5c3RlbTogQWRhcHRlYyB1UEQ3MjAxMHggVVNCIDIuMCBDb250cm9sbGVyCsKgwqAg
wqBDb250cm9sOiBJL08tIE1lbSsgQnVzTWFzdGVyKyBTcGVjQ3ljbGUtIE1lbVdJTlYrIFZHQVNu
b29wLSBQYXJFcnItIFN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJTlR4LQrCoMKgIMKgU3Rh
dHVzOiBDYXArIDY2TUh6LSBVREYtIEZhc3RCMkItIFBhckVyci0gREVWU0VMPW1lZGl1bSA+VEFi
b3J0LSA8VEFib3J0LSA8TUFib3J0LSA+U0VSUi0gPFBFUlItIElOVHgtCsKgwqAgwqBMYXRlbmN5
OiA2OCAoNDAwMG5zIG1pbiwgODUwMG5zIG1heCksIENhY2hlIExpbmUgU2l6ZTogMzIgYnl0ZXMK
wqDCoCDCoEludGVycnVwdDogcGluIEMgcm91dGVkIHRvIElSUSAyMgrCoMKgIMKgUmVnaW9uIDA6
IE1lbW9yeSBhdCBhMDAwMjAwMCAoMzItYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0yNTZd
CsKgwqAgwqBDYXBhYmlsaXRpZXM6IFs0MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDIKwqDC
oCDCoMKgwqDCoCBGbGFnczogUE1FQ2xrLSBEU0ktIEQxKyBEMisgQXV4Q3VycmVudD0wbUEgUE1F
KEQwKyxEMSssRDIrLEQzaG90KyxEM2NvbGQtKQrCoMKgIMKgwqDCoMKgIFN0YXR1czogRDAgTm9T
b2Z0UnN0LSBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQrCoMKgIMKgS2VybmVsIGRy
aXZlciBpbiB1c2U6IGVoY2ktcGNpCsKgwqAgwqBLZXJuZWwgbW9kdWxlczogZWhjaV9wY2kKCg==

