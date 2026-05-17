Return-Path: <linux-usb+bounces-37555-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHPGBlHkCWo6twQAu9opvQ
	(envelope-from <linux-usb+bounces-37555-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 17:52:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 905BA56229F
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 17:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6896303ADFB
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 15:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B15D3BC669;
	Sun, 17 May 2026 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocg2878u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070DA3A3E92
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779032779; cv=pass; b=AcFcxQJ2vpkwvm2nnIEBDrofHahiaEfzsBilVDrK9awSdYp5SJETLfhq8s16k9VrrCLp6iIjrJHx0kjlULS9hIaA8qKsYvSxFhzJvhHhy8N+Gk7JqOlBssymTbm4WjHgs5wjlWknAyV6dCI//ORAyjHgSXofvW1IcfGq/8ZahCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779032779; c=relaxed/simple;
	bh=o3cnWYkdJ6pnLV4LFLUfiTs4b7KEGkqvnVEHietiSJc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=M02hdtrcR21m60dv8q+vmtm7Qq6WMXztbkwKgpObOVIp5u9gi2jqfyh0Iy8LsdDCiT340dqYrvIbXTm7EP7cOU9TZTpjCnActkwlJTFH2+TxknZuFkOAdxynrWblH4RI595mrrWFGcrsz3kwcQZerwjKE9XUzWjAF+b3jUTQFQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocg2878u; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1305770f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 08:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779032776; cv=none;
        d=google.com; s=arc-20240605;
        b=XSaqhKqbySmgvEC8eK34EqRIiLi5PxjwmUpz+ay5bg6e70jSkJC4/hNKSHUPDvrGT5
         atUW2HwI5IwAXCPuCm7UHPnql7hi6rrDz8nj3f6rBUJXd8QLuu2Mh/dyqP/0XglhcGEk
         8vRGMwwIvCS73svtBYgYFqXg6bHqEBu4T1rEdo0zbh8354LssPhwa+rahaExnElwKnSa
         EssacanxgopJvbmc3NuPGqSTeZMv9Ymzb8SoKfneK0WKMz4TkLh11S5wdFaOG8iZ3CHb
         FbA1cFHa55wwEQN9nP3B1jaJ2212wqSPksCMBiAFG8gSTPuCScDlT85PQ7CnOyeX5vt4
         0WNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cYRlW3PCDhz0IzjnRHKXHL7UperzWJzJHc5JdYc23sI=;
        fh=LReMcbUeyoH3I59Lv0JihDOHlZGBqMn6s6pykGy0Whk=;
        b=gqHXG+E3DiAgxaPUlVBzF7zGiBC4M377Vp8mkG84mAr3DAEHVmpAcIM5YejiWgKAmu
         UVCYSH3CpOCY3qJkW+VZo19xu1iWBWbfTRz595vWES1EPgkiVTbBCV+oS+a7wFWZyOr7
         x0jD7k2EElYRHF9m6ZtQkaetdQFq898nScVTHPHHxmLw0rhZ4ZQ1xgb6FNrlVqJimL4V
         IzHDFYJpu3oCcEyFrfaZNHphEj03oaL4iU4jame/Vb3RhPRlAIJC8o99+MfGHDJWZXIC
         1Zk//LO/mOCIbGW2i7iE36i1MN8F3AirtpH3HEnHj6WUpG+YeqoufCYndelp56mnyunL
         XnrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779032776; x=1779637576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cYRlW3PCDhz0IzjnRHKXHL7UperzWJzJHc5JdYc23sI=;
        b=ocg2878u3GIeTdHUu7Rl4VvDR81quXTntjgqVnMcAg8lFogXKznbX/u7ZJXT7fNsgO
         NXfbmNHgX8Cdkqm7BcLcChSwXG3hl2rj/AZhO5Zj4YRu0dAcaVx/xnJtodnbNa8LseZn
         4E+S7kWk6+Zs/itLUeTuEJwL+9A7SBUq0EYwVFq9GJsU6mDpEho4uXmqAA7c7v1uZHrn
         bM2BPJf6RTC9+KmSRiWsbspssaedlB8mMlxw/DmjdZqSZaWQRDO+GqeJQBDizrdhNDBZ
         fuwXWvS3kV02HDrqz7twqyKF1g0ZFB6HcmK/lew2TSa7GFuP+5mE3X8NZKv8vZ3H+Cqh
         hXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032776; x=1779637576;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYRlW3PCDhz0IzjnRHKXHL7UperzWJzJHc5JdYc23sI=;
        b=GKacAQpYU/X/nf/4VCGHQwjHeuu1uuyCzP+uI6yifzEd7hkbBFazUMUL6JAV79Evm5
         ktSQVTD88ZA1rTpr+JDLoDseKsdYlAcQ6iX0it4axExi3nsVuBl7Iv32jiWxLvsRRYyI
         YqGt5Ki/4XhaZ7sUM4aPcOHlB358NbdSCu6e+O4pL5rFSTvY8rfQ9uA8lrJ2Gc3WVxG5
         YGIUjnmsXKcNj9200Kfogpe8kP8Fr9ZSZv5ED0mLsuQWqSVpCwMud1cqR3cWqGqUNclE
         2H26notgVo1nW302GoCrgrxg669nq0Vmcdmqodbp20RFrnI6wNr3erJXkcudIBZ1S/6E
         gUyA==
X-Forwarded-Encrypted: i=1; AFNElJ9mOErJcg+PeMYMzUxBI77+p3rvl095BoqetdDRNNVsHESs/UrWkuHgunSIHyxi/7ayNGH5Zo7xoDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdyeGqukTopObc0NPqvkJuCqRrDhu297FCmIHSA5TIHjUK4ttJ
	FenuAnUQ6ECe8c27XD014CNoQw87n2aJBWAug9HzevzNXPUauOAnQCdW99hiz9FVtQqaGcrVPhJ
	yhGg1OBW+N4N/kw4mPbdxXLbVx9ioXhE=
X-Gm-Gg: Acq92OHOW2CdCSQoAM40TLKVbumPX8m2tK9f4a5+9LzjSi6n6f4MV6+31UowGQJjNEU
	g83bB1y6E7YIYVv+sOKBQqu0T01UF9BzxceZ6hP3tmfkkvZHlae3Ne9jo2nU2StiSV/nzh+DXcC
	fdTyoQUriUeJ9hURU7yVKsAoS6T6r/DUJo6Xih1IwEQphLktAa+3pU6R7E30giVw0z43mkJzp2m
	TSivYzXZqZj1BaS2b/not3oHxcabPv5a61ORReemB9zSo2aki9ZFtVk4RgzbPEyfGIs73IF+u2Q
	1A9cIz8N
X-Received: by 2002:a5d:584c:0:b0:439:b8b2:fabc with SMTP id
 ffacd0b85a97d-45e5c587396mr16434984f8f.21.1779032776023; Sun, 17 May 2026
 08:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Sun, 17 May 2026 23:46:04 +0800
X-Gm-Features: AVHnY4LrrtEQK1BvcqcA5igpV4UTqBBKgJzZy77GQaOmTQBQeSdR0fwkPx14Lu4
Message-ID: <CAHPEe=Fs223obDewRunPdTtqhVOM11AXVsLRNHx+=NP0KiFwMQ@mail.gmail.com>
Subject: usb: gadget: aspeed_udc: list iterator used after loop in ast_udc_ep_dequeue
To: neal_liu@aspeedtech.com, gregkh@linuxfoundation.org
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a8c2340652055859"
X-Rspamd-Queue-Id: 905BA56229F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-37555-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,maoyixie.com:url]
X-Rspamd-Action: no action

--000000000000a8c2340652055859
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

(Resending from a personal address =E2=80=94 my previous attempt from
my NTU corporate account carried an auto-appended confidentiality
disclaimer that you've declined to accept. The content below is
unchanged.)

I have been running a small static check for list_for_each_entry
past-the-end patterns, similar to Jakob Koschel's 2022 cleanup
(commit 2966a9918df and related). The check flagged
ast_udc_ep_dequeue() in drivers/usb/gadget/udc/aspeed_udc.c, and I
would like to ask whether you consider this a real defect before I
send anything formal. The same code is present in v7.0 and in
v7.1-rc1 (the two files are byte-identical).

The code in question is around line 691:

    struct ast_udc_request *req;
    ...
    list_for_each_entry(req, &ep->queue, queue) {
        if (&req->req =3D=3D _req) {
            list_del_init(&req->queue);
            ast_udc_done(ep, req, -ESHUTDOWN);
            _req->status =3D -ECONNRESET;
            break;
        }
    }
    if (&req->req !=3D _req)
        rc =3D -EINVAL;

If nothing matches, the loop exits past-the-end and req becomes the
synthetic container_of(&ep->queue, struct ast_udc_request, queue).
Reading &req->req after the loop is undefined per C11. The post-loop
check works in practice only because real _req values do not collide
with that synthetic address.

What made me suspect this was not intentional is that 14 other UDC
drivers in the same directory (at91_udc, atmel_usba_udc, dummy_hcd,
fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc, max3420_udc,
net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx) use a
different pattern, with a separate iter cursor and a result variable.
For example dummy_hcd.c:

    struct dummy_request *req =3D NULL, *iter;
    list_for_each_entry(iter, &ep->queue, queue) {
        if (&iter->req !=3D _req) continue;
        ...
        req =3D iter;
        retval =3D 0;
        break;
    }
    if (retval =3D=3D 0) { ... }

aspeed_udc seems to be the only outlier in drivers/usb/gadget/udc/,
which is what made me think this was probably an oversight rather
than a deliberate idiom.

I also tried to confirm whether it observably misbehaves. If _req
happens to coincide with the synthetic past-the-end address, the
function returns 0 (success) on an empty queue without removing
anything. I attached a small userspace reproducer (poc_aspeed_udc.c
and its output log) that arranges this collision. In normal use _req
comes from the kernel slab and the collision is unlikely to happen
naturally, so I am not sure whether this rises to the level of a
real bug or just a code-quality issue.

Two questions:

  1. Do you consider the past-the-end use here a defect worth fixing,
     or is it an accepted idiom in this driver that I am misreading?

  2. If it is worth fixing, I already have a small patch that brings
     the function in line with the 14 sibling drivers. Would you like
     me to send it, or would you rather address it locally?

Thanks for taking a look, and apologies if I am off base on any of
this.

Best,
Maoyi Xie
--
Nanyang Technological University
https://maoyixie.com/

--000000000000a8c2340652055859
Content-Type: application/octet-stream; name="poc_aspeed_udc.c"
Content-Disposition: attachment; filename="poc_aspeed_udc.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mp9y3fo61>
X-Attachment-Id: f_mp9y3fo61

LyoKICogVXNlcnNwYWNlIHJlcHJvZHVjZXIgZm9yIHRoZSBwYXN0LXRoZS1lbmQgaXRlcmF0b3Ig
YmVoYXZpb3IgaW4KICogYXN0X3VkY19lcF9kZXF1ZXVlKCkgKGRyaXZlcnMvdXNiL2dhZGdldC91
ZGMvYXNwZWVkX3VkYy5jKS4KICoKICogQXNwZWVkIFVEQyBpcyBCTUMvQVJNIGhhcmR3YXJlLiBS
YXRoZXIgdGhhbiBicmluZ2luZyB1cCBhIGZ1bGwgU29DCiAqIGVtdWxhdGlvbiwgdGhpcyBwcm9n
cmFtIGV4dHJhY3RzIHRoZSBkZXF1ZXVlIGZ1bmN0aW9uJ3MgbG9naWMgaW50bwogKiB1c2Vyc3Bh
Y2UgdXNpbmcgbW9jayBzdHJ1Y3RzIHdob3NlIGxheW91dCAocmVxIGF0IG9mZnNldCAwLCBxdWV1
ZQogKiBpbW1lZGlhdGVseSBhZnRlcikgbWF0Y2hlcyB0aGUga2VybmVsIGRlZmluaXRpb24uIEl0
IHRoZW4gcnVucyBib3RoCiAqIHRoZSBleGlzdGluZyBjb2RlIHBhdGggYW5kIHRoZSBwcm9wb3Nl
ZCBmaXggb24gdGhlIHNhbWUgY3JhZnRlZCBpbnB1dC4KICoKICogQnVpbGQ6IGNjIC1PMCAtZyBw
b2NfYXNwZWVkX3VkYy5jIC1vIHBvY19hc3BlZWRfdWRjCiAqIFJ1bjogICAuL3BvY19hc3BlZWRf
dWRjICAgICAgICAgICAoZXhpc3RpbmcgY29kZSwgcmV0dXJucyA0MikKICogICAgICAgIC4vcG9j
X2FzcGVlZF91ZGMgcGF0Y2hlZCAgIChwcm9wb3NlZCBmaXgsIHJldHVybnMgMCkKICovCiNkZWZp
bmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2lu
Y2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8c3RkZGVmLmg+CgovKiBNaW5pbWFsIG1vY2sgb2Yg
dGhlIGtlcm5lbCBsaXN0X2hlYWQgYW5kIGNvbnRhaW5lcl9vZi4gKi8Kc3RydWN0IGxpc3RfaGVh
ZCB7IHN0cnVjdCBsaXN0X2hlYWQgKm5leHQsICpwcmV2OyB9OwoKI2RlZmluZSBjb250YWluZXJf
b2YocHRyLCB0eXBlLCBtZW1iZXIpIFwKICAgICgodHlwZSAqKSgoY2hhciAqKShwdHIpIC0gb2Zm
c2V0b2YodHlwZSwgbWVtYmVyKSkpCgojZGVmaW5lIGxpc3RfZmlyc3RfZW50cnkocHRyLCB0eXBl
LCBtZW1iZXIpIFwKICAgIGNvbnRhaW5lcl9vZigocHRyKS0+bmV4dCwgdHlwZSwgbWVtYmVyKQoj
ZGVmaW5lIGxpc3RfbmV4dF9lbnRyeShwb3MsIG1lbWJlcikgXAogICAgY29udGFpbmVyX29mKChw
b3MpLT5tZW1iZXIubmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlcikKI2RlZmluZSBsaXN0X2Vu
dHJ5X2lzX2hlYWQocG9zLCBoZWFkLCBtZW1iZXIpIFwKICAgICgmKHBvcyktPm1lbWJlciA9PSAo
aGVhZCkpCgojZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50cnkocG9zLCBoZWFkLCBtZW1iZXIpICAg
ICAgICAgICAgICAgXAogICAgZm9yIChwb3MgPSBsaXN0X2ZpcnN0X2VudHJ5KGhlYWQsIHR5cGVv
ZigqcG9zKSwgbWVtYmVyKTsgXAogICAgICAgICAhbGlzdF9lbnRyeV9pc19oZWFkKHBvcywgaGVh
ZCwgbWVtYmVyKTsgICAgICAgICAgICAgXAogICAgICAgICBwb3MgPSBsaXN0X25leHRfZW50cnko
cG9zLCBtZW1iZXIpKQoKc3RhdGljIHZvaWQgbGlzdF9pbml0KHN0cnVjdCBsaXN0X2hlYWQgKmgp
IHsgaC0+bmV4dCA9IGgtPnByZXYgPSBoOyB9CgovKiBNb2NrIHN0cnVjdHMuIE9ubHkgZmllbGQg
b3JkZXIgbWF0dGVyczogcmVxIGF0IG9mZnNldCAwLCBxdWV1ZQogKiBpbW1lZGlhdGVseSBhZnRl
ci4gKi8Kc3RydWN0IHVzYl9yZXF1ZXN0IHsKICAgIHZvaWQgKmJ1ZjsKICAgIHVuc2lnbmVkIGxl
bmd0aDsKICAgIGludCBzdGF0dXM7Cn07CgpzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0IHsKICAgIHN0
cnVjdCB1c2JfcmVxdWVzdCByZXE7CiAgICBzdHJ1Y3QgbGlzdF9oZWFkIHF1ZXVlOwogICAgaW50
IHBhZDsKfTsKCnN0cnVjdCBhc3RfdWRjX2VwIHsKICAgIHN0cnVjdCBsaXN0X2hlYWQgcXVldWU7
Cn07CgovKiBFeGlzdGluZyBjb2RlIHBhdGggZnJvbSBhc3BlZWRfdWRjLmMgYXJvdW5kIGxpbmUg
NjkxLiBMb2NrcyBhbmQKICogdGhlIGFzdF91ZGNfZG9uZSgpIGNhbGxiYWNrIGFyZSBlbGlkZWQg
c2luY2UgdGhlIHBhc3QtdGhlLWVuZAogKiBiZWhhdmlvciBpcyBpbmRlcGVuZGVudCBvZiB0aGVt
LiAqLwpzdGF0aWMgaW50IGFzdF91ZGNfZXBfZGVxdWV1ZV9leGlzdGluZyhzdHJ1Y3QgYXN0X3Vk
Y19lcCAqZXAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
dXNiX3JlcXVlc3QgKl9yZXEpCnsKICAgIHN0cnVjdCBhc3RfdWRjX3JlcXVlc3QgKnJlcTsKICAg
IGludCByYyA9IDA7CgogICAgbGlzdF9mb3JfZWFjaF9lbnRyeShyZXEsICZlcC0+cXVldWUsIHF1
ZXVlKSB7CiAgICAgICAgaWYgKCZyZXEtPnJlcSA9PSBfcmVxKSB7CiAgICAgICAgICAgIC8qIGxp
c3RfZGVsX2luaXQgKyBhc3RfdWRjX2RvbmUgKyBzZXQgc3RhdHVzIGhlcmUgKi8KICAgICAgICAg
ICAgYnJlYWs7CiAgICAgICAgfQogICAgfQoKICAgIC8qIFdoZW4gdGhlIGxvb3AgZmluZHMgbm8g
bWF0Y2gsIHJlcSBpcyBwYXN0LXRoZS1lbmQuIFJlYWRpbmcKICAgICAqICZyZXEtPnJlcSBpcyB1
bmRlZmluZWQgcGVyIEMxMTsgdGhlIHJlc3VsdGluZyBjaGVjayBpcyBhCiAgICAgKiBwcm9wZXJ0
eSBvZiBoZWFwIGxheW91dCByYXRoZXIgdGhhbiB0aGUgcXVldWUgY29udGVudHMuICovCiAgICBp
ZiAoJnJlcS0+cmVxICE9IF9yZXEpCiAgICAgICAgcmMgPSAtMjI7ICAgICAvKiAtRUlOVkFMICov
CgogICAgcmV0dXJuIHJjOwp9CgovKiBQcm9wb3NlZCBmaXggdXNpbmcgdGhlIHNlcGFyYXRlIGl0
ZXIgY3Vyc29yIHBhdHRlcm4gc2hhcmVkIGJ5IHRoZQogKiBvdGhlciBVREMgZHJpdmVycyBpbiB0
aGUgc2FtZSBkaXJlY3RvcnkgKGUuZy4gZHVtbXlfaGNkLmMpLiAqLwpzdGF0aWMgaW50IGFzdF91
ZGNfZXBfZGVxdWV1ZV9wYXRjaGVkKHN0cnVjdCBhc3RfdWRjX2VwICplcCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHVzYl9yZXF1ZXN0ICpfcmVxKQp7CiAg
ICBzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0ICpyZXEgPSBOVUxMLCAqaXRlcjsKCiAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5KGl0ZXIsICZlcC0+cXVldWUsIHF1ZXVlKSB7CiAgICAgICAgaWYgKCZpdGVy
LT5yZXEgIT0gX3JlcSkKICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgcmVxID0gaXRlcjsK
ICAgICAgICBicmVhazsKICAgIH0KCiAgICBpZiAoIXJlcSkKICAgICAgICByZXR1cm4gLTIyOyAg
ICAgLyogLUVJTlZBTCAqLwoKICAgIC8qIGxpc3RfZGVsX2luaXQgKyBhc3RfdWRjX2RvbmUgKyBz
ZXQgc3RhdHVzIGhlcmUgKi8KICAgIHJldHVybiAwOwp9CgppbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqKmFyZ3YpCnsKICAgIGludCB1c2VfcGF0Y2hlZCA9IChhcmdjID4gMSAmJiAhc3RyY21wKGFy
Z3ZbMV0sICJwYXRjaGVkIikpOwoKICAgIHN0cnVjdCBhc3RfdWRjX2VwIGVwOwogICAgbGlzdF9p
bml0KCZlcC5xdWV1ZSk7CgogICAgLyogQW4gZW1wdHkgcXVldWUgZm9yY2VzIHRoZSBleGlzdGlu
ZyBjb2RlJ3MgaXRlcmF0b3IgcGFzdCB0aGUgZW5kLgogICAgICogcGFzdF9lbmQgaXMgdGhlIHN5
bnRoZXRpYyBhc3RfdWRjX3JlcXVlc3QgcG9pbnRlciB0aGUgbG9vcCB3aWxsCiAgICAgKiBsZWF2
ZSBiZWhpbmQuIEJlY2F1c2UgcmVxIGlzIHRoZSBmaXJzdCBtZW1iZXIsICZwYXN0X2VuZC0+cmVx
CiAgICAgKiBoYXMgdGhlIHNhbWUgbnVtZXJpYyB2YWx1ZSBhcyBwYXN0X2VuZCBpdHNlbGYuICov
CiAgICBzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0ICpwYXN0X2VuZCA9CiAgICAgICAgY29udGFpbmVy
X29mKCZlcC5xdWV1ZSwgc3RydWN0IGFzdF91ZGNfcmVxdWVzdCwgcXVldWUpOwogICAgc3RydWN0
IHVzYl9yZXF1ZXN0ICpmYWtlX3JlcSA9ICZwYXN0X2VuZC0+cmVxOwoKICAgIHByaW50ZigiW3Nl
dHVwXSBlcC5xdWV1ZT0lcCAoaGVhZClcbiIsICh2b2lkICopJmVwLnF1ZXVlKTsKICAgIHByaW50
ZigiW3NldHVwXSBwYXN0X2VuZD0lcFxuIiwgKHZvaWQgKilwYXN0X2VuZCk7CiAgICBwcmludGYo
IltzZXR1cF0gZmFrZV9yZXE9JXBcbiIsICh2b2lkICopZmFrZV9yZXEpOwoKICAgIGludCByYzsK
ICAgIGlmICh1c2VfcGF0Y2hlZCkgewogICAgICAgIHJjID0gYXN0X3VkY19lcF9kZXF1ZXVlX3Bh
dGNoZWQoJmVwLCBmYWtlX3JlcSk7CiAgICAgICAgcHJpbnRmKCJbcHJvYmVdIHBhdGNoZWQgcmM9
JWRcbiIsIHJjKTsKICAgIH0gZWxzZSB7CiAgICAgICAgcmMgPSBhc3RfdWRjX2VwX2RlcXVldWVf
ZXhpc3RpbmcoJmVwLCBmYWtlX3JlcSk7CiAgICAgICAgcHJpbnRmKCJbcHJvYmVdIGV4aXN0aW5n
IHJjPSVkXG4iLCByYyk7CiAgICB9CgogICAgaWYgKHJjID09IDApIHsKICAgICAgICBwcmludGYo
IltyZXN1bHRdIHJldHVybmVkIDAgKHN1Y2Nlc3MpIG9uIGVtcHR5IHF1ZXVlIHdpdGhvdXQgIgog
ICAgICAgICAgICAgICAicmVtb3ZpbmcgYW55dGhpbmdcbiIpOwogICAgICAgIHJldHVybiA0MjsK
ICAgIH0KICAgIHByaW50ZigiW3Jlc3VsdF0gcmV0dXJuZWQgJWQgKHJlamVjdGVkKVxuIiwgcmMp
OwogICAgcmV0dXJuIDA7Cn0K
--000000000000a8c2340652055859
Content-Type: application/octet-stream; name="poc_aspeed_udc.log"
Content-Disposition: attachment; filename="poc_aspeed_udc.log"
Content-Transfer-Encoding: base64
Content-ID: <f_mp9y3fnz0>
X-Attachment-Id: f_mp9y3fnz0

JCAuL3BvY19hc3BlZWRfdWRjCltzZXR1cF0gZXAucXVldWU9MHg3ZmZlZmUwYjFjZDAgKGhlYWQp
CltzZXR1cF0gcGFzdF9lbmQ9MHg3ZmZlZmUwYjFjYzAKW3NldHVwXSBmYWtlX3JlcT0weDdmZmVm
ZTBiMWNjMApbcHJvYmVdIGV4aXN0aW5nIHJjPTAKW3Jlc3VsdF0gcmV0dXJuZWQgMCAoc3VjY2Vz
cykgb24gZW1wdHkgcXVldWUgd2l0aG91dCByZW1vdmluZyBhbnl0aGluZwoKJCAuL3BvY19hc3Bl
ZWRfdWRjIHBhdGNoZWQKW3NldHVwXSBlcC5xdWV1ZT0weDdmZmVlNjQ4ZWVlMCAoaGVhZCkKW3Nl
dHVwXSBwYXN0X2VuZD0weDdmZmVlNjQ4ZWVkMApbc2V0dXBdIGZha2VfcmVxPTB4N2ZmZWU2NDhl
ZWQwCltwcm9iZV0gcGF0Y2hlZCByYz0tMjIKW3Jlc3VsdF0gcmV0dXJuZWQgLTIyIChyZWplY3Rl
ZCkK
--000000000000a8c2340652055859--

