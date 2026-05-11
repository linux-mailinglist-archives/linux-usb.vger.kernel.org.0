Return-Path: <linux-usb+bounces-37282-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNA0CAFRAmqkrAEAu9opvQ
	(envelope-from <linux-usb+bounces-37282-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 23:58:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E45168CB
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 23:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CC123037438
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 21:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E594D98FA;
	Mon, 11 May 2026 21:58:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A9D34DCC7;
	Mon, 11 May 2026 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778536688; cv=none; b=UzqUSLMD8TMm0MISqPpUsvLX9rBo0kehYjiVRKQKYCtmgpNR25RPbyoXH3UE6KsfYTTU4UlAnsooKl9Y8EFbQagb2DN83ifg37epYo6DGQxocDdyA1/SvHScenFMJpnvxApZptdCYe8F5Unle8EbatWlGKxhQWFt5Rk5K/zF+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778536688; c=relaxed/simple;
	bh=1i16ZR9qoS3rh0hPKuESzlVsEu+/cQwtoblyv7mL9wI=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=SueOYa0t/zU0PMYKkNR273rhfLCIs5wmPrRo4iC9Jbxq12B9mrKKIDWFYGT9K0zL8SIdOhQb5HkvWYDwC8Jj9tJgsS0n+fehk4cSaSpbTm63nRySFLXjrOKsS89at1iwBVt14nEJnxh0jSmUE/dMeP6YMn6DWaZl0A4XMVx0BtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af765.dynamic.kabel-deutschland.de [95.90.247.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 287E54C2C37F00;
	Mon, 11 May 2026 23:57:34 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------ZjKhgj2VAadPB7IkJSUJfcKq"
Message-ID: <69fa1c3f-3ea9-42cb-a49a-7da39f72806e@molgen.mpg.de>
Date: Mon, 11 May 2026 23:57:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IBM Power S822LC: pci 0021:0d:00.0: xHCI HW did not halt within
 32000 usec status = 0x0
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <fb68e15d-b8f2-42ac-aa65-0d9fedcfcdbd@molgen.mpg.de>
 <20260506193037.6de9e355.michal.pecio@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260506193037.6de9e355.michal.pecio@gmail.com>
X-Rspamd-Queue-Id: 7C5E45168CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[mpg.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37282-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.934];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-usb@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[anthropic.com:email,molgen.mpg.de:mid,mpg.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b:email]
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------ZjKhgj2VAadPB7IkJSUJfcKq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Cc: +linuxppc-dev]

Dear Michal,


Thank you for your reply.

Am 06.05.26 um 19:30 schrieb Michal Pecio:
> On Wed, 6 May 2026 18:06:20 +0200, Paul Menzel wrote:

>> On the IBM Power S822LC (8335-GCA POWER8), rebooting into Linux 7.1-rc2+
>> with kexec results in the warning below:
>>
>>       [    0.000000] Linux version 7.1.0-rc2+ (x@b) (gcc (Ubuntu 11.2.0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #3 SMP PREEMPT Wed May  6 08:50:5
>>       […]
>>       [    0.000000] Hardware name: 8335-GCA POWER8 (raw) 0x4d0200 opal:skiboot-5.4.8-5787ad3 PowerNV
>>       […]
>>       [    1.593760] NET: Registered PF_UNIX/PF_LOCAL protocol family
>>       [    1.593859] pci 0021:0d:00.0: enabling device (0140 -> 0142)
>>       [    1.627080] pci 0021:0d:00.0: xHCI HW did not halt within 32000 usec status = 0x0
>>       [    1.627094] pci 0021:0d:00.0: quirk_usb_early_handoff+0x0/0x300 took 32465 usecs
>>       [    1.627123] PCI: CLS 0 bytes, default 128

> Does it work any better if kexecing other kernel versions?

No, the problem goes as far back as 5.17-rc7. (I didn’t try anything 
before.)

> What if you increase XHCI_MAX_HALT_USEC by 10* or 100* ?

I have to test this.

> Does the controller work normally after this warning?
It does not look like it. In the log attached to my report, later on 
there is:

     [    1.739374] xhci_hcd 0021:0d:00.0: xHCI Host Controller
     [    1.739431] xhci_hcd 0021:0d:00.0: new USB bus registered, 
assigned bus number 1
     [    1.794727] Freeing initrd memory: 52928K
     [    1.801984] xhci_hcd 0021:0d:00.0: Host halt failed, -110
     [    1.801988] xhci_hcd 0021:0d:00.0: can't setup: -110
     [    1.802137] xhci_hcd 0021:0d:00.0: USB bus 1 deregistered
     [    1.802154] xhci_hcd 0021:0d:00.0: init 0021:0d:00.0 fail, -110
     [    1.802250] xhci_hcd 0021:0d:00.0: probe with driver xhci_hcd 
failed with error -110

`lsusb` also does not list the device. But I need to check on hardware.


Kind regards,

Paul


PS: Claude Sonnet 4.6 cooked up the attached patch, which does *not* 
help though, but does get it to the return code 0x10, which Claude 
replied to with:

> ● The status change 0x0 → 0x10 is meaningful: 0x10 is PCD (Port Change Detect, bit 4),
>   HCHalted=0. The old-kernel reset (from our commit) did take effect …

Please excuse, if I attach/cite hallucinations.
--------------ZjKhgj2VAadPB7IkJSUJfcKq
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-xhci-Reset-controller-on-kexec-to-prevent-stale-.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-xhci-Reset-controller-on-kexec-to-prevent-stale-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiMTEwZDEyOGViZTY2MmEwMjMxOWFmNjg5OWQ4ZGM1MDc1OWExMTQ3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBQYXVsIE1lbnplbCA8cG1lbnplbEBtb2xnZW4ubXBn
LmRlPgpEYXRlOiBNb24sIDExIE1heSAyMDI2IDE3OjMzOjM1ICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gdXNiOiB4aGNpOiBSZXNldCBjb250cm9sbGVyIG9uIGtleGVjIHRvIHByZXZlbnQg
c3RhbGUgc3RhdGUKIGluIG5leHQga2VybmVsCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0CgpXaGVuIGtleGVjIGlzIHVzZWQgdG8gYm9vdCBpbnRvIGEgbmV3IExpbnV4
IGtlcm5lbCwgeGhjaV9zaHV0ZG93bigpIG9ubHkKaGFsdHMgdGhlIHhIQ0kgY29udHJvbGxl
ciAoQ01EX1JVTj0wLCB3YWl0cyBmb3IgU1RTX0hBTFQpIHdpdGhvdXQKcmVzZXR0aW5nIGl0
LiAgQWZ0ZXIgaGFsdCwgdGhlIGNvbnRyb2xsZXIgc3RpbGwgaG9sZHMgc3RhbGUgaW50ZXJu
YWwgc3RhdGUKZnJvbSB0aGUgb2xkIGtlcm5lbDogdGhlIERDQkFBIHBvaW50ZXIsIHNjcmF0
Y2hwYWQgYnVmZmVyIGFkZHJlc3MsIGV2ZW50CmFuZCBjb21tYW5kIHJpbmcgZGVxdWV1ZSBw
b2ludGVycywgYW5kIHNvIG9uLCBhbGwgcG9pbnRpbmcgaW50byB0aGUgb2xkCmtlcm5lbCdz
IG5vdy1pbnZhbGlkIG1lbW9yeS4KCklmIHBsYXRmb3JtIGZpcm13YXJlIChlLmcuIE9QQUwg
b24gSUJNIFBPV0VSOCkgdGhlbiB0b3VjaGVzIHRoZSBVU0IKY29udHJvbGxlciBkdXJpbmcg
dGhlIGtleGVjIHRyYW5zaXRpb24g4oCTIGZvciBleGFtcGxlIHRvIHByb3ZpZGUgYSBVU0IK
a2V5Ym9hcmQgY29uc29sZSDigJMgaXQgbWF5IGF0dGVtcHQgdG8gdXNlIHRob3NlIHN0YWxl
IHJpbmctYnVmZmVyCnBvaW50ZXJzLiAgVGhpcyBsZWF2ZXMgdGhlIGNvbnRyb2xsZXIgaW4g
YW4gdW5kZWZpbmVkLCBydW5uaW5nIHN0YXRlCihTVFNfSEFMVD0wKSB3aGVuIHRoZSBuZXcg
a2VybmVsIGFycml2ZXMuICBUaGUgbmV3IGtlcm5lbCdzIGVhcmx5CnF1aXJrX3VzYl9oYW5k
b2ZmX3hoY2koKSBmaXh1cCB0aGVuIGZhaWxzIHRvIGhhbHQgdGhlIGNvbnRyb2xsZXIgYW5k
CnRoZSB4SENJIGRyaXZlciBjYW4gbm8gbG9uZ2VyIGluaXRpYWxpc2UgaXQsIHByb2R1Y2lu
ZzoKCiAgSUJNIFBvd2VyIFM4MjJMQzogcGNpIDAwMjE6MGQ6MDAuMDogeEhDSSBIVyBkaWQg
bm90IGhhbHQgd2l0aGluCiAgICAgICAgICAgICAgICAgICAgMzIwMDAgdXNlYyBzdGF0dXMg
PSAweDAKCkEgUGV0aXRib290LXRvLUxpbnV4IGtleGVjIGNoYWluIHdvcmtzIGNvcnJlY3Rs
eSBiZWNhdXNlIFBldGl0Ym9vdCwgYXMKdGhlIGFjdGl2ZSBVU0Igb3duZXIsIHByb3Blcmx5
IGhhbHRlZCB0aGUgY29udHJvbGxlcjsgdGhlIG5ldyBrZXJuZWwKZmluZHMgaXQgY2xlYW5s
eSBoYWx0ZWQuCgpGaXggdGhpcyBieSBpc3N1aW5nIGEgY29udHJvbGxlciByZXNldCAoQ01E
X1JFU0VUKSBhZnRlciB0aGUgaGFsdAp3aGVuZXZlciBrZXhlYyBpcyBpbiBwcm9ncmVzcy4g
IFRoZSByZXNldCBjbGVhcnMgYWxsIGludGVybmFsIHN0YXRlCihEQ0JBQSwgc2NyYXRjaHBh
ZCwgcmluZyBidWZmZXJzLCBwb3J0IHN0YXRlKSBzbyB0aGF0IGFueSBmaXJtd2FyZSBvcgp0
aGUgaW5jb21pbmcga2VybmVsIGFsd2F5cyBzdGFydHMgZnJvbSBhIHdlbGwta25vd24sIGlu
aXRpYWxpc2F0aW9uLXJlYWR5CnN0YXRlLiAgVGhpcyBtaXJyb3JzIHRoZSBhcHByb2FjaCBh
bHJlYWR5IHVzZWQgZm9yIHRoZQpYSENJX1NQVVJJT1VTX1dBS0VVUCBhbmQgWEhDSV9SRVNF
VF9UT19ERUZBVUxUIHF1aXJrcy4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9mYjY4ZTE1ZC1iOGYyLTQyYWMtYWE2NS0wZDlmZWRjZmNkYmRAbW9sZ2VuLm1wZy5kZS8K
U2lnbmVkLW9mZi1ieTogUGF1bCBNZW56ZWwgPHBtZW56ZWxAbW9sZ2VuLm1wZy5kZT4KQXNz
aXN0ZWQtYnk6IENsYXVkZSBTb25uZXQgNC42IDxub3JlcGx5QGFudGhyb3BpYy5jb20+Ci0t
LQogZHJpdmVycy91c2IvaG9zdC94aGNpLmMgfCAxMiArKysrKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvaG9zdC94aGNpLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYwppbmRl
eCBhNTRmNWI1N2YyMDU1Li41NTAzMWQwM2FkNDBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Vz
Yi9ob3N0L3hoY2kuYworKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYwpAQCAtOSw2ICs5
LDcgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvamlmZmllcy5oPgorI2luY2x1ZGUgPGxp
bnV4L2tleGVjLmg+CiAjaW5jbHVkZSA8bGludXgvcGNpLmg+CiAjaW5jbHVkZSA8bGludXgv
aW9tbXUuaD4KICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KQEAgLTc3NSwxMSArNzc2LDE2
IEBAIHZvaWQgeGhjaV9zaHV0ZG93bihzdHJ1Y3QgdXNiX2hjZCAqaGNkKQogCXhoY2lfaGFs
dCh4aGNpKTsKIAogCS8qCi0JICogV29ya2Fyb3VuZCBmb3Igc3B1cmlvdXMgd2FrZXBzIGF0
IHNodXRkb3duIHdpdGggSFNXLCBhbmQgZm9yIGJvb3QKLQkgKiBmaXJtd2FyZSBkZWxheSBp
biBBREwtUCBQQ0ggaWYgcG9ydCBhcmUgbGVmdCBpbiBVMyBhdCBzaHV0ZG93bgorCSAqIFdv
cmthcm91bmQgZm9yIHNwdXJpb3VzIHdha2V1cHMgYXQgc2h1dGRvd24gd2l0aCBIU1csIGFu
ZCBmb3IgYm9vdAorCSAqIGZpcm13YXJlIGRlbGF5IGluIEFETC1QIFBDSCBpZiBwb3J0cyBh
cmUgbGVmdCBpbiBVMyBhdCBzaHV0ZG93bi4KKwkgKiBBbHNvIHJlc2V0IG9uIGtleGVjIHRv
IGxlYXZlIHRoZSBjb250cm9sbGVyIGluIGEgY2xlYW4gc3RhdGUgd2l0aAorCSAqIGFsbCBp
bnRlcm5hbCBzdGF0ZSAoRENCQUEsIHNjcmF0Y2hwYWQsIHJpbmdzKSBjbGVhcmVkLCBzbyB0
aGUgbmV4dAorCSAqIGtlcm5lbCBjYW4gaW5pdGlhbGl6ZSBpdCB3aXRob3V0IGludGVyZmVy
ZW5jZSBmcm9tIHN0YWxlIHBvaW50ZXJzCisJICogaW50byB0aGUgb2xkIGtlcm5lbCdzIG1l
bW9yeS4KIAkgKi8KIAlpZiAoeGhjaS0+cXVpcmtzICYgWEhDSV9TUFVSSU9VU19XQUtFVVAg
fHwKLQkgICAgeGhjaS0+cXVpcmtzICYgWEhDSV9SRVNFVF9UT19ERUZBVUxUKQorCSAgICB4
aGNpLT5xdWlya3MgJiBYSENJX1JFU0VUX1RPX0RFRkFVTFQgfHwKKwkgICAga2V4ZWNfaW5f
cHJvZ3Jlc3MpCiAJCXhoY2lfcmVzZXQoeGhjaSwgWEhDSV9SRVNFVF9TSE9SVF9VU0VDKTsK
IAogCXNwaW5fdW5sb2NrX2lycSgmeGhjaS0+bG9jayk7Ci0tIAoyLjU0LjAKCg==

--------------ZjKhgj2VAadPB7IkJSUJfcKq--

