Return-Path: <linux-usb+bounces-32131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ADAD0D47D
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 11:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4FCB302D5E4
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 10:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA6E2FDC2C;
	Sat, 10 Jan 2026 10:09:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607B829AAF3;
	Sat, 10 Jan 2026 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768039768; cv=none; b=A5m2LAYVz12bcKVEYf5iZjqNmQ8WysGiBdq/z5F3AqKQhePmUMAJPCUQOw7uvgccv4LkRf6mOoVbSgdUM8CpUW+lO8a8kkHrdEd+to4DF7RZeFjuaTrn9SvbibRVEwCLCalJloeVV7XTyu0xpPBIpyHsyC3Q2ACUePBFC2JPAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768039768; c=relaxed/simple;
	bh=iHanaQI7FTVBZ82cX3dg6rbaBDLe30zPAaSYTaTrvhs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=b25i+KB/d/m9ozv4i9LGhSKRmqDa7VAlwh0k7ueZ+6NI1moIpHiGgWvdS0a+SE6/zIHizfHwN0msMhJBHGT1bFju6NPHMwUMcf5Uju6riVSPNmBNQUuiccIwcsKczXdDhvuNE2r10qEITSIFRinPuHZMgZ5T9WgFvkD093HI6K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [121.236.206.128])
	by gateway (Coremail) with SMTP id _____8AxjsNSJWJpSFgHAA--.24372S3;
	Sat, 10 Jan 2026 18:09:22 +0800 (CST)
Received: from chenhuacai$loongson.cn ( [121.236.206.128] ) by
 ajax-webmail-front1 (Coremail) ; Sat, 10 Jan 2026 18:09:20 +0800
 (GMT+08:00)
Date: Sat, 10 Jan 2026 18:09:20 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Alan Stern" <stern@rowland.harvard.edu>
Subject: Re: Re: [PATCH] USB: HCD: remove logic about which hcd is loaded
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250609(354f7833) Copyright (c) 2002-2026 www.mailtech.cn loongson
In-Reply-To: <2026011037-kinfolk-serotonin-0b5d@gregkh>
References: <2026010739-diffuser-shelter-e31c@gregkh>
 <5f013d5a.3a686.19ba74f85dc.Coremail.chenhuacai@loongson.cn>
 <2026011037-kinfolk-serotonin-0b5d@gregkh>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: KE85NWZvb3Rlcl90eHQ9MTkzMTo2MTg=
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7e7ef90b.3a68c.19ba761c225.Coremail.chenhuacai@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:qMiowJAxeuBQJWJpSzQXAA--.4831W
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/1tbiAQEDBmlh6jYAqgABs6
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFWDWFyktrWxJw4DuFyrXwc_yoW8uF4Dpa
	yxKa13ursrJwn7C3sI934IkFy3Ww1kJrZrWrWDK347Z39093sxXryxZF1FgFy3Ja4Sg3W8
	uanFq3srt3Wqy3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFcxC0VAYjxAxZF
	0Ew4CEw7xC0wACY4xI67k04243AVC20s07MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JwCE64xv
	F2IEb7IF0Fy7YxBIdaVFxhVjvjDU0xZFpf9x07jbOz3UUUUU=

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiR3JlZyBLcm9haC1IYXJ0
bWFuIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4g5Y+R6YCB5pe26Ze0OjIwMjYtMDEt
MTAgMTc6NTQ6MTAgKOaYn+acn+WFrSkKPiDmlLbku7bkuro6IOmZiOWNjuaJjSA8Y2hlbmh1YWNh
aUBsb29uZ3Nvbi5jbj4KPiDmioTpgIE6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsICJBbGFuIFN0ZXJuIiA8c3Rlcm5Acm93bGFuZC5oYXJ2
YXJkLmVkdT4KPiDkuLvpopg6IFJlOiBbUEFUQ0hdIFVTQjogSENEOiByZW1vdmUgbG9naWMgYWJv
dXQgd2hpY2ggaGNkIGlzIGxvYWRlZAo+IAo+IE9uIFNhdCwgSmFuIDEwLCAyMDI2IGF0IDA1OjQ5
OjI1UE0gKzA4MDAsIOmZiOWNjuaJjSB3cm90ZToKPiA+IAo+ID4gCj4gPiAKPiA+ID4gLS0tLS3l
jp/lp4vpgq7ku7YtLS0tLQo+ID4gPiDlj5Hku7bkuro6ICJHcmVnIEtyb2FoLUhhcnRtYW4iIDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+ID4g5Y+R6YCB5pe26Ze0OjIwMjYtMDEtMDcg
MjM6MjU6NDAgKOaYn+acn+S4iSkKPiA+ID4g5pS25Lu25Lq6OiBsaW51eC11c2JAdmdlci5rZXJu
ZWwub3JnCj4gPiA+IOaKhOmAgTogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgIkdyZWcg
S3JvYWgtSGFydG1hbiIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiwgIkh1YWNhaSBDaGVu
IiA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj4sICJBbGFuIFN0ZXJuIiA8c3Rlcm5Acm93bGFuZC5o
YXJ2YXJkLmVkdT4KPiA+ID4g5Li76aKYOiBbUEFUQ0hdIFVTQjogSENEOiByZW1vdmUgbG9naWMg
YWJvdXQgd2hpY2ggaGNkIGlzIGxvYWRlZAo+ID4gPiAKPiA+ID4gSXQgdHVybnMgb3V0IHRoYXQg
d2FybmluZyBhYm91dCB3aGljaCBVU0IgaG9zdCBjb250cm9sbGVyIGlzIGxvYWRlZAo+ID4gPiBi
ZWZvcmUgYW5vdGhlciBvbmUgZG9lc24ndCByZWFsbHkgbWF0dGVyLiAgQWxsIHRoYXQgcmVhbGx5
IGlzIG5lZWRlZCBpcwo+ID4gPiB0aGUgUENJIHNvZnRkZXAgbW9kdWxlIGxvYWRpbmcgbG9naWMs
IHdoaWNoIGhhcyBiZWVuIHByZXNlbnQgaW4gdGhlCj4gPiA+IGtlcm5lbCBldmVyIHNpbmNlIGNv
bW1pdCAwNWM5MmRhMGM1MjQgKCJ1c2I6IG9oY2kvdWhjaSAtIGFkZCBzb2Z0Cj4gPiA+IGRlcGVu
ZGVuY2llcyBvbiBlaGNpX3BjaSIpCj4gPiA+IAo+ID4gPiBTbyByZW1vdmUgdGhlIHdhcm5pbmcg
bWVzc2FnZXMsIHRoZXkgYXJlIG5vdCB1c2VmdWwsIG5vdCBuZWVkZWQsIGFuZAo+ID4gPiBvbmx5
IGNvbmZ1c2UgcGVvcGxlLiAgQXMgY2FuIGJlIHNlZW4gaW4gdGhlIGRpc2N1c3Npb24gYXQKPiA+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTIzMDA4MDAxNC4zOTM0NTkwLTEtY2hl
bmh1YWNhaUBsb29uZ3Nvbi5jbgo+ID4gPiAKPiA+ID4gQ2M6IEh1YWNhaSBDaGVuIDxjaGVuaHVh
Y2FpQGxvb25nc29uLmNuPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IEFsYW4gU3Rlcm4gPHN0ZXJuQHJv
d2xhbmQuaGFydmFyZC5lZHU+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1h
biA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogSHVhY2FpIENo
ZW4gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4gPiAKPiA+IEFuZCBpdCBzaG91bGQgYmUgYmFj
a3BvcnRlZCB0byBzdGFibGUgYnJhbmNoZXM/Cj4gCj4gSXQgZG9lc24ndCBjaGFuZ2UgYW55IGJl
aGF2aW9yLCBzbyB3aHkgd291bGQgaXQgYmUgbmVlZGVkIGFueXdoZXJlIGVsc2U/Cj4gSXQncyBq
dXN0IHJlbW92aW5nIGEgbWVzc2FnZSB0aGF0IHBlb3BsZSBoYXZlIGJlZW4gaWdub3JpbmcgZm9y
IGEgdmVyeQo+IHZlcnkgbG9uZyB0aW1lIDopCkJlY2F1c2UgSSAoYW5kIG90aGVycykgZG9uJ3Qg
d2FudCB0byBzZWUgYSBib2d1cyB3YXJuaW5nIHdoZW4gSSB1c2UgTFRTIGJyYW5jaGVzLgoKSHVh
Y2FpCgo+IAo+IHRoYW5rcywKPiAKPiBncmVnIGstaAoNCg0K5pys6YKu5Lu25Y+K5YW26ZmE5Lu2
5ZCr5pyJ6b6Z6Iqv5Lit56eR55qE5ZWG5Lia56eY5a+G5L+h5oGv77yM5LuF6ZmQ5LqO5Y+R6YCB
57uZ5LiK6Z2i5Zyw5Z2A5Lit5YiX5Ye655qE5Liq5Lq65oiW576k57uE44CC56aB5q2i5Lu75L2V
5YW25LuW5Lq65Lul5Lu75L2V5b2i5byP5L2/55So77yI5YyF5ous5L2G5LiN6ZmQ5LqO5YWo6YOo
5oiW6YOo5YiG5Zyw5rOE6Zyy44CB5aSN5Yi25oiW5pWj5Y+R77yJ5pys6YKu5Lu25Y+K5YW26ZmE
5Lu25Lit55qE5L+h5oGv44CC5aaC5p6c5oKo6ZSZ5pS25pys6YKu5Lu277yM6K+35oKo56uL5Y2z
55S16K+d5oiW6YKu5Lu26YCa55+l5Y+R5Lu25Lq65bm25Yig6Zmk5pys6YKu5Lu244CCIA0KVGhp
cyBlbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0
aW9uIGZyb20gTG9vbmdzb24gVGVjaG5vbG9neSAsIHdoaWNoIGlzIGludGVuZGVkIG9ubHkgZm9y
IHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkg
dXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaGVyZWluIGluIGFueSB3YXkgKGluY2x1
ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJl
cHJvZHVjdGlvbiBvciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGVt
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcGhvbmUgb3IgZW1haWwg
aW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSBpdC4gDQoNCg0K


