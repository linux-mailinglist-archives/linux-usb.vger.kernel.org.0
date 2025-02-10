Return-Path: <linux-usb+bounces-20368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B22EBA2E361
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 06:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F6A3A50C7
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 05:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DD115CD52;
	Mon, 10 Feb 2025 05:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oscium-com.20230601.gappssmtp.com header.i=@oscium-com.20230601.gappssmtp.com header.b="THxlsVpa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5962F2A
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 05:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739164017; cv=none; b=dxuLsFbkLDSpGaZ/p6yZ+LKtNcHkwV4uAEmkfaOaZjKkhA9a10P2YzTtrxJLsdd51Nm43hQelt66JAxcaUY/2LrPnpUc0DjfiQn6UvcUWCZeUEipRxRfb+JpV+8wAvBG5YbdDT8y8b2kbo9hFMgm9YKmLGaf+3uTfzGaZPUTTLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739164017; c=relaxed/simple;
	bh=zfKZmUROPNYKesuDDrfPYL5hJsceC2ftx/twf3X5BF8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=R/SjC+BxKhkmJ2quTtqUfIF3UKsmanIVnlkx/phmuOiXtS5xlZgVTxfVe0//0csWtlOFgH6ZHInpBynVsAOp5CQfQzvmz8r15ko3WcOJi1MT985dW9gG6nuGSGxdNFAlU1ScW3EGuzX5jD9MyHKR+78R37G0nDErVhBsZwZnBgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oscium.com; spf=pass smtp.mailfrom=oscium.com; dkim=pass (2048-bit key) header.d=oscium-com.20230601.gappssmtp.com header.i=@oscium-com.20230601.gappssmtp.com header.b=THxlsVpa; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oscium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscium.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51f22008544so599828e0c.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Feb 2025 21:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oscium-com.20230601.gappssmtp.com; s=20230601; t=1739164014; x=1739768814; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A9khYksJIAVyR9asVgTPgbACmRdb9TBYEGTLw5nH9Bo=;
        b=THxlsVpacSGFj7NbDvF6iQoiF7jj38ModX1siGTANu14IvfgdB+sS6LPj3LViZm2pL
         0iWpWDyk3L0NjEeUflQVAfpILQvJuXENBL1ckQGZ6qY0aQmI/XzipY+pvO4CBbF0QpNX
         Y6v6WLer0Ghcj/7ON1wNcvIn5T0M7F0OLegRNwwWmGBkTAJftGZ/wT2UT48xj0+qhJp6
         ULupxR4Du9ttkPslzVyVb3q7H6APEcGxasbbVWVKDQpj2vy6GiUN5sEN80J7ln8F63vc
         KxJhZ64RKhn/qE5Lg3VucWS9S3mdZfu0LHEfYUBZ1m7ZrhfPcQzHybf297tzpsUIS2yh
         rPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739164014; x=1739768814;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9khYksJIAVyR9asVgTPgbACmRdb9TBYEGTLw5nH9Bo=;
        b=oJTRBV9Q8JfLPlvxm5CBzIokJnqZKcdFidg6H8xbGVV7s+kzJ4NoIloOvgOFET8tuo
         a4p32/B8bfQnGXZolfEP8GCVQxgJZ5viUTt0/OqXOj30MNahxWM//9TFZIKI1Fdmq+je
         QKNwgzsWHFRkEQNgszqvhkCKVBvRuYo7j93nNKSUZLFPQyCGoqk6C+bUuIsTYfTAGc4Y
         nAdTodqTC5ekomKmbNveiHDQUwBn3pmxgtfJ624rjaNtCpIkGvgTuWL3LLkdDK7jsp++
         ytvPDMymB2OuL3oGZIxBqH+6clR5p6VOznFGkNKDstg1/pWhtKIEY0Q0qAN2B6N4/rZ9
         j6zw==
X-Gm-Message-State: AOJu0Yx2KniHK9VvDr2keNG5k79iRh6q8axcyFSH3e6JTOGlXnPgOaGr
	q/5x0Ld8VSzbzXS75u8xEset/DJdS3ojC8Nw8snTliEM1LCN1SeDv22+351RNTNv5jWb7qbpRyQ
	YDcogQWZsZ2PI6VXXGRfOjB+L0vz1a7jUbE2BAjXzcSbV4Fou6QE=
X-Gm-Gg: ASbGncvxbmiBrjt45NVwc170RM3epMw3zr9+GUL+8p8KoOR36AuYLSAu682rwU07reM
	mjUCuRHuC6JPYTs24psaw8+kveiUthsMrSxTN2a1MVDAR22jzbhqqwrW86Uk05NTZBcPgNVI=
X-Google-Smtp-Source: AGHT+IGBevKDj/D8wQRE9tKNlfcvW9UAtlxONuKRIuhkOhcjRCh+m4jai+kYD3tmxp9YBbtS1BCl9Cdl/Fm5RzPFb6Q=
X-Received: by 2002:a05:6122:794:b0:518:7ab7:afbc with SMTP id
 71dfb90a1353d-51f2e251f93mr8312153e0c.7.1739164014022; Sun, 09 Feb 2025
 21:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Matt Lee <matt@oscium.com>
Date: Sun, 9 Feb 2025 23:06:42 -0600
X-Gm-Features: AWEUYZmYoFaTD2A9l50vIjdTphAFSQqaO1KlVZU2YWlpYCikut8q5Iqj8XetKyY
Message-ID: <CABrMTjdyZX3P4-0hjndjAFer7FaA+rRNmLLjigg8qjV6VbLP1g@mail.gmail.com>
Subject: [PATCH 0/2] USB: max3421: Fix retransmit handling and scheduling
 while atomic
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, matt@oscium.com
Content-Type: multipart/mixed; boundary="000000000000434d48062dc2ad6b"

--000000000000434d48062dc2ad6b
Content-Type: multipart/alternative; boundary="000000000000434d46062dc2ad69"

--000000000000434d46062dc2ad69
Content-Type: text/plain; charset="UTF-8"

This patch series addresses two issues in the max3421 USB host controller
driver:

1. **Patch 1** This patch reverts the removal of the slow retransmit of NAK
responses.  This fixes some USB accessories from becoming unresponsive.

2. **Patch 2** fixes a "scheduling while atomic" bug in `max3421_remove()`
by ensuring that `kthread_stop()` is called outside a spinlock, preventing
a system crash when removing the driver or shutting down.

Both patches have been tested on a BCM2711 with MAX3421 hardware.

Kind regards,
Matt Lee
matt@oscium.com

---

**Patches:**
**[PATCH 1/2] USB: max3421: Fix retransmit handling for NAK responses**
**[PATCH 2/2] USB: max3421: Fix scheduling while atomic in
max3421_remove()**

--000000000000434d46062dc2ad69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch series addresses two issues in the max3421 USB =
host controller driver:<br><br>1. **Patch 1** This patch reverts the remova=
l of the slow retransmit of NAK responses.=C2=A0 This fixes some USB access=
ories from becoming unresponsive.<div><br>2. **Patch 2** fixes a &quot;sche=
duling while atomic&quot; bug in `max3421_remove()` by ensuring that `kthre=
ad_stop()` is called outside a spinlock, preventing a system crash when rem=
oving the driver or shutting down.<br><br>Both patches have been tested on =
a BCM2711 with MAX3421 hardware.<br><br>Kind regards, =C2=A0<br>Matt Lee<br=
><a href=3D"mailto:matt@oscium.com">matt@oscium.com</a><br><br>---<br><br>*=
*Patches:** =C2=A0<br>**[PATCH 1/2] USB: max3421: Fix retransmit handling f=
or NAK responses** =C2=A0<br>**[PATCH 2/2] USB: max3421: Fix scheduling whi=
le atomic in max3421_remove()** =C2=A0<br></div></div>

--000000000000434d46062dc2ad69--
--000000000000434d48062dc2ad6b
Content-Type: application/octet-stream; 
	name="0001-USB-max3421-Fix-retransmit-handling.patch"
Content-Disposition: attachment; 
	filename="0001-USB-max3421-Fix-retransmit-handling.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m6ykzt8n0>
X-Attachment-Id: f_m6ykzt8n0

RnJvbTogWW91ciBOYW1lIDxtYXR0QG9zY2l1bS5jb20+ClN1YmplY3Q6IFtQQVRDSCAxLzJdIFVT
QjogbWF4MzQyMTogSW1wcm92ZSByZXRyYW5zbWl0IGhhbmRsaW5nIGZvciBOQUsgcmVzcG9uc2Vz
CgpUaGlzIHJldmVydHMgYSBwcmV2aW91aXNseSBzdWJtaXR0ZWQgcGF0Y2ggd2hlcmUgdGhlIHNs
b3cgcmV0cmFuc21pdCB3YXMgcmVtb3ZlZC4KClByZXZpb3VzbHksIHRoZSBtYXgzNDIxIGRyaXZl
ciB3b3VsZCBpbW1lZGlhdGVseSByZXRyeSB0cmFuc21pc3Npb25zIGluZGVmaW5pdGVseSAKdXBv
biByZWNlaXZpbmcgYSBOQUsgcmVzcG9uc2UsIGxlYWRpbmcgdG8gcG90ZW50aWFsIHN0YWxscy4K
ClRoaXMgcGF0Y2ggcmUtaW50cm9kdWNlcyBhIGxpbWl0IChgTkFLX01BWF9GQVNUX1JFVFJBTlNN
SVRTYCkgb24gaG93IG1hbnkgdGltZXMgYSAKcmVxdWVzdCBpcyByZXRyYW5zbWl0dGVkIGltbWVk
aWF0ZWx5LiAgQWZ0ZXIgcmVhY2hpbmcgdGhpcyBsaW1pdCwgdGhlIGRyaXZlciAKZmFsbHMgYmFj
ayB0byBhIHNsb3dlciByZXRyYW5zbWl0IHN0cmF0ZWd5IHVzaW5nIGBtYXgzNDIxX3Nsb3dfcmV0
cmFuc21pdCgpYC4KClRoaXMgaW1wcm92ZXMgcm9idXN0bmVzcyB3aGVuIGRlYWxpbmcgd2l0aCB1
bnJlc3BvbnNpdmUgVVNCIGRldmljZXMuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0IExlZSA8bWF0dEBv
c2NpdW0uY29tPgotLS0KIGRyaXZlcnMvdXNiL2hvc3QvbWF4MzQyMS1oY2QuYyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2hvc3QvbWF4MzQyMS1oY2QuYyBiL2RyaXZlcnMvdXNiL2hvc3QvbWF4MzQyMS1oY2QuYwpp
bmRleCAxMjM0NTY3Li5hYmNkZWYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9ob3N0L21heDM0
MjEtaGNkLmMKKysrIGIvZHJpdmVycy91c2IvaG9zdC9tYXgzNDIxLWhjZC5jCkBAIC03Miw2ICs3
MiwxMiBAQAogI2RlZmluZSBVU0JfTUFYX0ZSQU1FX05VTUJFUiAgIDB4N2ZmCiAjZGVmaW5lIFVT
Ql9NQVhfUkVUUklFUyAgICAgICAgMyAvKiAjIG9mIHJldHJpZXMgYmVmb3JlIGVycm9yIGlzIHJl
cG9ydGVkICovCgorLyoKKyAqIE1heC4gIyBvZiB0aW1lcyB3ZSdyZSB3aWxsaW5nIHRvIHJldHJh
bnNtaXQgYSByZXF1ZXN0IGltbWVkaWF0ZWx5IGluCisgKiByZXNwb25zZSB0byBhIE5BSy4gIEFm
dGVyd2FyZHMsIHdlIGZhbGwgYmFjayBvbiB0cnlpbmcgb25jZSBhIGZyYW1lLgorICovCisjZGVm
aW5lIE5BS19NQVhfRkFTVF9SRVRSQU5TTUlUUyAgICAgICAyCisKICNkZWZpbmUgUE9XRVJfQlVE
R0VUICAgNTAwICAgICAvKiBpbiBtQTsgdXNlIDggZm9yIGxvdy1wb3dlciBwb3J0IHRlc3Rpbmcg
Ki8KCiAvKiBQb3J0LWNoYW5nZSBtYXNrOiAqLwpAQCAtOTI0LDggKzkzMCwxMSBAQCBtYXgzNDIx
X2hhbmRsZV9lcnJvcihzdHJ1Y3QgdXNiX2hjZCAqaGNkCiAgICAgICAgICAgICAgICAgKiBEZXZp
Y2Ugd2Fzbid0IHJlYWR5IGZvciBkYXRhIG9yIGhhcyBubyBkYXRhCiAgICAgICAgICAgICAgICAg
KiBhdmFpbGFibGU6IHJldHJ5IHRoZSBwYWNrZXQgYWdhaW4uCiAgICAgICAgICAgICAgICAgKi8K
KyAgICAgICAgICAgICAgIGlmIChtYXgzNDIxX2VwLT5uYWtzKysgPCBOQUtfTUFYX0ZBU1RfUkVU
UkFOU01JVFMpIHsKICAgICAgICAgICAgICAgIG1heDM0MjFfbmV4dF90cmFuc2ZlcihoY2QsIDEp
OwogICAgICAgICAgICAgICAgc3dpdGNoX3NuZGZpZm8gPSAwOworICAgICAgICAgICAgICAgfSBl
bHNlCisgICAgICAgICAgICAgICAgICAgICAgIG1heDM0MjFfc2xvd19yZXRyYW5zbWl0KGhjZCk7
CiAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICB9CiAgICAgICAgaWYgKHN3aXRjaF9zbmRm
aWZvKQotLSAKMi4zNC4xCgo=
--000000000000434d48062dc2ad6b
Content-Type: application/octet-stream; 
	name="0002-USB-max3421-Fix-scheduling-while-atomic.patch"
Content-Disposition: attachment; 
	filename="0002-USB-max3421-Fix-scheduling-while-atomic.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m6ykzurq1>
X-Attachment-Id: f_m6ykzurq1

RnJvbTogTWF0dCBMZWUgPG1hdHRAb3NjaXVtLmNvbT4KU3ViamVjdDogW1BBVENIIDIvMl0gVVNC
OiBtYXgzNDIxOiBGaXggc2NoZWR1bGluZyB3aGlsZSBhdG9taWMgaW4gbWF4MzQyMV9yZW1vdmUo
KQoKQSBidWcgaW4gYG1heDM0MjFfcmVtb3ZlKClgIGNhdXNlZCBhICJzY2hlZHVsaW5nIHdoaWxl
IGF0b21pYyIgY3Jhc2ggd2hlbiAKYGt0aHJlYWRfc3RvcCgpYCB3YXMgY2FsbGVkIHdoaWxlIGhv
bGRpbmcgYSBzcGlubG9jay4KClRoaXMgcGF0Y2ggZW5zdXJlcyB0aGF0IGBrdGhyZWFkX3N0b3Ao
KWAgaXMgY2FsbGVkIG91dHNpZGUgdGhlIHNwaW5sb2NrLCAKZml4aW5nIHRoZSBjcmFzaCBhbmQg
aW1wcm92aW5nIHN5c3RlbSBzdGFiaWxpdHkgd2hlbiB1bmxvYWRpbmcgdGhlIGRyaXZlci4KClNp
Z25lZC1vZmYtYnk6IE1hdHQgTGVlIDxtYXR0QG9zY2l1bS5jb20+Ci0tLQogZHJpdmVycy91c2Iv
aG9zdC9tYXgzNDIxLWhjZC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L21heDM0MjEt
aGNkLmMgYi9kcml2ZXJzL3VzYi9ob3N0L21heDM0MjEtaGNkLmMKaW5kZXggYWJjZGVmMC4uMTIz
NDU2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvaG9zdC9tYXgzNDIxLWhjZC5jCisrKyBiL2Ry
aXZlcnMvdXNiL2hvc3QvbWF4MzQyMS1oY2QuYwpAQCAtMTkzNiwxMSArMTk0NSwxMCBAQCBtYXgz
NDIxX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogICAgICAgIHVzYl9yZW1vdmVfaGNk
KGhjZCk7CgogICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZtYXgzNDIxX2hjZC0+bG9jaywgZmxh
Z3MpOworICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1heDM0MjFfaGNkLT5sb2NrLCBm
bGFncyk7CgogICAgICAgIGt0aHJlYWRfc3RvcChtYXgzNDIxX2hjZC0+c3BpX3RocmVhZCk7Cgot
ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1heDM0MjFfaGNkLT5sb2NrLCBmbGFncyk7
Ci0KICAgICAgICBmcmVlX2lycShzcGktPmlycSwgaGNkKTsKCiAgICAgICAgdXNiX3B1dF9oY2Qo
aGNkKTsKLS0gCjIuMzQuMQoK
--000000000000434d48062dc2ad6b--

