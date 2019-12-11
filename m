Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D367E11A5C7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 09:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbfLKIXc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 03:23:32 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53961 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728277AbfLKIXc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 03:23:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 72B1422256;
        Wed, 11 Dec 2019 03:23:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 11 Dec 2019 03:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        date:subject:from:to:cc:mime-version:content-type
        :content-transfer-encoding:message-id; s=fm1; bh=lRKD2FADm2HXumb
        QzwlPtnGYbF3zZFsMfL0UnoIxGao=; b=FBGYBjQaHpQm9sEo0/hL++CeXRDhycZ
        0vSZtEWRN7qfbqvuNdk1wwnCh/r/Xur167eXALVDpsKO6xrqIjZLCF/sy6kBa2i+
        qraK8je/JcvaafkSEezkPj/T4wPp/PJGl8fhnsroiXV45ysdipleakf7gkKrOnVN
        aI5fxALua7FuYV7+GOfq3YHYa8b0LMLZeCbj5gMsGY/pByPgIu0HGkKvRkT7UQbR
        mRR+Ng2O67C+SZ2S4eEHz2LD+nxH/+CICP6prfnZjRdG43RA1atqjgh0utBhsV/d
        Olo51XRlIIgcVBYYsFmxameKZSXUh4uza7DAj0IPZERCrDYq4KCWr5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lRKD2F
        ADm2HXumbQzwlPtnGYbF3zZFsMfL0UnoIxGao=; b=aKmswz0NqAvViZFHrDzHQ6
        rVaAEPNydjlocCXjY0ZakAsXzZdhzkE7/FIMmbKx9nzSKFaVP34je2JnZWeUytGp
        sA7GCbDZIUGM+Osjfhohf+fcxI2pHno9MYbO4O2n3uSyA2z1GQRWURBKg/+Qftxu
        uEOOZA+VGhefj0WZFjoOS8KhKqC6WLJhe8EflNA/csJYY/58TpnBsUN/HLNG5AMj
        QD7slL3Dfig8VAph8KL+gz5d/KIYNSdwFZjIFzBqLa9yi78XRz9pu6XnE9p0SXmE
        683Hlk1jYMrr2541emtjpCn5qKsawcIpxof2OzJckcKUOiq4kiJAbRr+kr4tnpuQ
        ==
X-ME-Sender: <xms:g6fwXd4t0DgE3-pNJej9YE7EyRfBIzJKX1ZrVgJV0nnteTv9F1sI6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffuffhvfggtgfgsehtsgdttddttdejnecuhfhrohhmpeetuggrmhcuifgr
    uhhsmhgrnhhnuceorghgrghushhmrghnnhesfhgrshhtmhgrihhlrdgtohhmqeenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvudeirddvvdelrdejledrvdduieen
    ucfrrghrrghmpehmrghilhhfrhhomheprghgrghushhmrghnnhesfhgrshhtmhgrihhlrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:g6fwXVuNudWwQDzsaruPtuzAChx7x7Ptbk29qp3t7ppTFfWNglkqDg>
    <xmx:g6fwXSu-DMEij0OEuFwY7B8wGqxMHCcEoH2gQ5s9WvEhO7OE9IMTqg>
    <xmx:g6fwXVtS00jMfXBE9UfmlFFikux48EDfr6QMpLqek58HjR-MBnHldg>
    <xmx:g6fwXSV0dF4MFMLYWY8Av1tOmHvR1OEkYj96dayffrWgTC0PMqJS8w>
Received: from [192.168.0.16] (216-229-79-216.fidnet.com [216.229.79.216])
        by mail.messagingengine.com (Postfix) with ESMTPA id EC13530600AB;
        Wed, 11 Dec 2019 03:23:30 -0500 (EST)
Date:   Wed, 11 Dec 2019 02:23:28 -0600
Subject: Re: Raven Ridge xhci_hcd not working: "Refused to change power
 state, currently in D3"
From:   Adam Gausmann <agausmann@fastmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Message-Id: <20191211082330.EC13530600AB@mailuser.nyi.internal>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SXQgaGFzIGJlZW4gc2V2ZXJhbCBtb250aHMgc2luY2UgSSBsYXN0IHBvc3RlZCBvbiB0aGlzIHRo
cmVhZCwgYW5kIHRoZSBpc3N1ZSBzdGlsbCBwZXJzaXN0cy4gSG93ZXZlciwgSSBoYXZlIG1hZGUg
YSBkaXNjb3ZlcnkhCgpUaGUgaXNzdWUgaXMgbm9uZXhpc3RlbnQgb24gZnJlc2ggaW5zdGFsbHMg
b2YgTGludXguIEkndmUgdHJpZWQgbXVsdGlwbGUgZGlzdHJpYnV0aW9ucyBhbmQgaGF2ZW4ndCBi
ZWVuIGFibGUgdG8gcmVwcm9kdWNlIC0gdW50aWwgSSBpbnN0YWxsIGFuZCBhY3RpdmF0ZSBsYXB0
b3AtbW9kZS10b29scy4KCkFueSBhZHZpY2UgYXMgdG8gd2hlcmUgdG8gZ28gZnJvbSBoZXJlPwoK
LSBBZGFtCgpPbiBNYXkgMjIsIDIwMTkgMDc6MjMsIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDIyLCAyMDE5IGF0IDA1OjU0OjIwQU0g
LTA1MDAsIEFkYW0gR2F1c21hbm4gd3JvdGU6IAo+ID4gT24gV2VkLCBNYXkgMjIsIDIwMTksIGF0
IDAwOjUxLCBHcmVnIEtIIHdyb3RlOiAKPiA+ID4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDQ6
NDk6MTRQTSAtMDUwMCwgQWRhbSBHYXVzbWFubiB3cm90ZTogCj4gPiA+ID4gT24gbXkgVGhpbmtQ
YWQgRTU4NSwgd2l0aCBhIFJ5emVuIDUgMjUwMFUsIG15IFhIQ0kgZHJpdmVyIGNyYXNoZXMgd2hl
biBwbHVnZ2luZyBpbiBhIGRldmljZSBhZnRlciBzd2l0Y2hpbmcgcG93ZXIgc3RhdGVzLCBvciBk
dXJpbmcgc3dpdGNoaW5nIGl0c2VsZi4gCj4gPiA+ID4gCj4gPiA+ID4gU3RlcHMgdG8gUmVwcm9k
dWNlOiAKPiA+ID4gPiAKPiA+ID4gPiAtIFVucGx1ZyB0aGUgQUMgcG93ZXIsIG9yIHN0YXJ0IHRo
ZSBjb21wdXRlciB3aXRoIEFDIHVucGx1Z2dlZC4gSWYgdGhlIGNvbXB1dGVyIGhhcyBBQyBwb3dl
ciBhdCBib290LCBpdCB3aWxsIHdvcmsgcHJvcGVybHksIGJ1dCBwbHVnZ2luZyBpdCBpbiBhZnRl
ciBydW5uaW5nIHVucGx1Z2dlZCB3aWxsIG5vdC4gCj4gPiA+ID4gCj4gPiA+ID4gVGhlIHhoY2lf
aGNkIGFuZCB4aGNpX3BjaSBtb2R1bGVzIHJlbWFpbiBsb2FkZWQgYWZ0ZXIgdGhlIGVycm9yLiBS
ZWxvYWRpbmcgdGhlbSBhcHBlYXJzIHRvIHJlc2V0IGl0LCBhbmQgdGhlIHNjZW5hcmlvcyBhYm92
ZSBzdGlsbCBhcHBseSBhcyBpZiB0aGUgY29tcHV0ZXIgd2FzIGp1c3Qgc3RhcnRlZC4gCj4gPiA+
ID4gCj4gPiA+ID4gVGhlc2UgdGVzdHMgd2VyZSBwZXJmb3JtZWQgd2l0aCBsYXB0b3BfbW9kZSBk
aXNhYmxlZDsgZW5hYmxpbmcgaXQgYWx0ZXJzIHRoZSBiZWhhdmlvci4gSSB3aWxsIHRlc3QgdGhh
dCBtb3JlIGxhdGVyLiAKPiA+ID4gPiAKPiA+ID4gPiBSZXN1bHRzOiAKPiA+ID4gPiAKPiA+ID4g
PiBUaGUgVVNCIGRldmljZSBmYWlscyB0byByZWdpc3RlciwgYW5kIGBsc3VzYmAgcmVtYWlucyB1
bmNoYW5nZWQuIE5vIG90aGVyIGVycm9ycyB3aWxsIGFwcGVhciBhZnRlciB0aGUgZmlyc3Qgb25l
IG9jY3Vycy4gCj4gPiA+ID4gT25lIG9mIHR3byBlcnJvciBtZXNzYWdlcyB3aWxsIGFwcGVhciBp
biBrZXJuZWwgbG9nczogCj4gPiA+ID4gCj4gPiA+ID4gW8KgwqAgNTEuMjc2NjUwXSB4aGNpX2hj
ZCAwMDAwOjA1OjAwLjQ6IFJlZnVzZWQgdG8gY2hhbmdlIHBvd2VyIHN0YXRlLCBjdXJyZW50bHkg
aW4gRDMgCj4gPiA+ID4gW8KgwqAgNTEuMjc2NjU4XSB4aGNpX2hjZCAwMDAwOjA1OjAwLjM6IFJl
ZnVzZWQgdG8gY2hhbmdlIHBvd2VyIHN0YXRlLCBjdXJyZW50bHkgaW4gRDMgCj4gPiA+ID4gW8Kg
wqAgNTEuMjc3MDUxXSB4aGNpX2hjZCAwMDAwOjA1OjAwLjM6IGVuYWJsaW5nIGRldmljZSAoMDAw
MCAtPiAwMDAyKSAKPiA+ID4gPiBbwqDCoCA1MS4yNzcwNzRdIHhoY2lfaGNkIDAwMDA6MDU6MDAu
MzogV0FSTjogeEhDIHJlc3RvcmUgc3RhdGUgdGltZW91dCAKPiA+ID4gPiBbwqDCoCA1MS4yNzcw
NzddIHhoY2lfaGNkIDAwMDA6MDU6MDAuMzogUENJIHBvc3QtcmVzdW1lIGVycm9yIC0xMTAhIAo+
ID4gPiA+IFvCoMKgIDUxLjI3OTMxNl0geGhjaV9oY2QgMDAwMDowNTowMC4zOiBIQyBkaWVkOyBj
bGVhbmluZyB1cCAKPiA+ID4gPiBbwqDCoCA1MS4yODg2NjldIHhoY2lfaGNkIDAwMDA6MDU6MDAu
NDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpIAo+ID4gPiA+IAo+ID4gPiA+IFsgNTI1
OC40MzgwMjFdIHhoY2lfaGNkIDAwMDA6MDU6MDAuMzogUmVmdXNlZCB0byBjaGFuZ2UgcG93ZXIg
c3RhdGUsIGN1cnJlbnRseSBpbiBEMyAKPiA+ID4gPiBbIDUyNTguNDM4MzI4XSB4aGNpX2hjZCAw
MDAwOjA1OjAwLjQ6IFJlZnVzZWQgdG8gY2hhbmdlIHBvd2VyIHN0YXRlLCBjdXJyZW50bHkgaW4g
RDMgCj4gPiA+ID4gWyA1MjU4LjQ1MDAyNl0geGhjaV9oY2QgMDAwMDowNTowMC4zOiBlbmFibGlu
ZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikgCj4gPiA+ID4gWyA1MjU4LjQ1MDUxMV0geGhjaV9oY2Qg
MDAwMDowNTowMC40OiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikgCj4gPiA+ID4gWyA1
MjY2LjExMjk0MV0geGhjaV9oY2QgMDAwMDowNTowMC4zOiBFcnJvciB3aGlsZSBhc3NpZ25pbmcg
ZGV2aWNlIHNsb3QgSUQgCj4gPiA+ID4gWyA1MjY2LjExMjk1Ml0geGhjaV9oY2QgMDAwMDowNTow
MC4zOiBNYXggbnVtYmVyIG9mIGRldmljZXMgdGhpcyB4SENJIGhvc3Qgc3VwcG9ydHMgaXMgNjQu
IAo+ID4gPiA+IFsgNTI2Ni4xMTI5NjNdIHVzYiB1c2IxLXBvcnQyOiBjb3VsZG4ndCBhbGxvY2F0
ZSB1c2JfZGV2aWNlIAo+ID4gPiA+IFsgNTI4MC45NjA5NjhdIHhoY2lfaGNkIDAwMDA6MDU6MDAu
MzogRXJyb3Igd2hpbGUgYXNzaWduaW5nIGRldmljZSBzbG90IElEIAo+ID4gPiA+IFsgNTI4MC45
NjA5NzldIHhoY2lfaGNkIDAwMDA6MDU6MDAuMzogTWF4IG51bWJlciBvZiBkZXZpY2VzIHRoaXMg
eEhDSSBob3N0IHN1cHBvcnRzIGlzIDY0LiAKPiA+ID4gPiBbIDUyODAuOTYwOTkzXSB1c2IgdXNi
MS1wb3J0MjogY291bGRuJ3QgYWxsb2NhdGUgdXNiX2RldmljZSAKPiA+ID4gPiAKPiA+ID4gPiBF
eHBlY3RlZCByZXN1bHRzOiAKPiA+ID4gPiAKPiA+ID4gPiBEZXZpY2UgY29ubmVjdHMsIHBvd2Vy
cyBvbiwgYW5kIHJlZ2lzdGVycyBwcm9wZXJseSwgc2hvd2luZyB1cCBpbiBgbHN1c2JgLiAKPiA+
ID4gPiAKPiA+ID4gPiBCdWlsZDogCj4gPiA+ID4gCj4gPiA+ID4gTGludXggNC4xOS40NF8xICMx
IFNNUCBQUkVFTVBUIFdlZCBNYXIgMjcgMjA6NDE6MzggVVRDIDIwMTkgeDg2XzY0IEdOVS9MaW51
eCwgd2l0aCBmaXJtd2FyZSAyMDE4MTIxOCAKPiA+ID4gCj4gPiA+IDQuMTkgaXMgcHJldHR5IG9s
ZCBmb3IgeGhjaSBhbmQgbm9ybWFsIGRlc2t0b3Agc3lzdGVtcy7CoCBDYW4geW91IHBsZWFzZSAK
PiA+ID4gdHJ5IDUuMSBhbmQgc2VlIGlmIHRoYXQgcmVzb2x2ZXMgdGhlIGlzc3VlIG9yIG5vdD8g
Cj4gPiA+IAo+ID4gPiB0aGFua3MsIAo+ID4gPiAKPiA+ID4gZ3JlZyBrLWggCj4gPiA+IAo+ID4g
Cj4gPiBIaSBHcmVnLCB0aGFua3MgZm9yIHlvdXIgZmVlZGJhY2suIAo+ID4gCj4gPiBJJ3ZlIGp1
c3QgdGVzdGVkIHRoaXMgb24gNS4xLjNfMSB3aXRoIHRoZSBzYW1lIHJlc3VsdHMgYXMgYmVmb3Jl
LiBJIAo+ID4gc2hvdWxkIGFsc28gbm90ZSB0aGF0IEkgYW0gdXNpbmcgdGhlIGtlcm5lbCBhbmQg
ZmlybXdhcmUgYXMgcGFja2FnZWQgCj4gPiBieSBWb2lkIExpbnV4LCBhbmQgdGhlc2UgYXBwZWFy
IHRvIGJlIHRoZSBsYXRlc3QgYXZhaWxhYmxlIGZyb20gdGhlbS4gCj4gPiBTaG91bGQgSSB0cnkg
dGhlIGxhdGVzdCBmaXJtd2FyZSByZWxlYXNlIGZyb20gZ2l0Lmtlcm5lbC5vcmcgYXMgd2VsbD8g
Cj4KPiBJIGRvdWJ0IHlvdSBoYXZlIGFueSBmaXJtd2FyZSBoZXJlLCB0aGlzIGxvb2tzIGxpa2Ug
YW4geGhjaSBpc3N1ZS4gCj4KPiBDYW4geW91IHByb3ZpZGUgdGhlIGxvZyBtZXNzYWdlcyBmcm9t
IDUuMS4zP8KgIFRoZXkgbWlnaHQgYmUgYSBiaXQgCj4gZGlmZmVyZW50LiAKPgo+IHRoYW5rcywg
Cj4KPiBncmVnIGstaCAK

