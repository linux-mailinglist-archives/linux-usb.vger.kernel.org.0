Return-Path: <linux-usb+bounces-36162-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB2LCcaL2mnd3ggAu9opvQ
	(envelope-from <linux-usb+bounces-36162-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 19:58:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25C3E1290
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 19:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A21CA300DF54
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 17:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB89B3BAD8F;
	Sat, 11 Apr 2026 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kndfICZh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF00332623
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775930303; cv=pass; b=Spk+Pi+nFIVdxGs4330Fv8xeWUYuFcXjKdekLh9IhiBN0n3EzZIPMN+bfO3C3p/GQVpkfi/dU7X1kFHoZ6B45oL8EPxS/w3lZ40qpV1Yrh1IgWVKHh0r4kTulwOkqYAlWj7wKFg35AY/auGVIyslLA23PKpIzd/NN5RN7No/Ve0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775930303; c=relaxed/simple;
	bh=K9cNahQL7sU3k6YTlTe4h+cxu2W+ZHClkJ+CtHxghjQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=B89iMI8S7tuXitUYooCO1LqCMzc56VgwXUrlnK0550NIjNHFOw/1iZLJ5RCkgX2BqebRIecXYQqnqbd9sgQV+mzOYjW1aLO4fd/zI/LllLiSz/k2n1I8nfa7cRPXwnAtLHVraXuSgN21M9a09V3alMMyBeBE8Y1EKB/MYYMdj20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kndfICZh; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56d93f119bfso158720e0c.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 10:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775930300; cv=none;
        d=google.com; s=arc-20240605;
        b=MUepKjFPF2NwHlZd6yHSxQ8CBsp+Bkjbwr0YORc8dXoxatKu7abkotI6/aK3h3+WMQ
         nV3rv+UkY1+Z5sRPFnkga6mkoaqxJBCLXi4/JXxEkhPtuydzhput6R6vbzDTH3ctqDyy
         PkHyB6ACGVm6QIdA3C+gr6DSm9qQ6uf16Y6SbOqrIHQWEkvlLt+9I8aU0YrPJw6UHsZu
         SlpofOM9co/MNFl0MDfpxJWrNDMhRWrnWQUq3wHMTiW5VdwtQAfiH7Z7Oo83KN+cGkAr
         ylfejaOva1P82+kDQtJW8cMFlAdsnGBPTw7Cx1EtQdehE8F0H140rQm+Lh3UbIm+AVwY
         bK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=FQ9FMt2GgCLKM11biLesryR+G33OllgKjO21lfayfy8=;
        fh=GtsfIgjBd9H9eDjKDNLq8u7m35/8X3LTIj9oaQ3uJw8=;
        b=Wrm0tonH6pL6hXTBORs3qV5GaNQk+nixrKGeYjzBrM0YcSR46nSkwjtplHV3P0Kge1
         lEQ4PByHT5Aw/rq32hcQyRujI0NIeQOB9nAeds1SBWRDGUiVLy+Zy9DJEV6kyngqWvaT
         1YlA9pgbeMVYukgFs0oHkoAd9tW/vb5tCfnwpILpEZs9JE4Hx1bCWRqPleX7z6rExtxA
         H/jQX2mFMfkDGNMStj5kImDJ3sx5am7dxEU3Wy9keJ9fOBo9ymCswtbPUPKBSvfFZtyH
         OvX6nD95uxcDh0cfqlVpQb4R3g2zZLD4X5CE1++saJ+WwBxPIUieH/kRdU4kz3ugozz/
         T6zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775930300; x=1776535100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ9FMt2GgCLKM11biLesryR+G33OllgKjO21lfayfy8=;
        b=kndfICZhttip+fX8FmKYYHNFF5k4HaUFdTaQOab8uOiFuPyvsd1+fALtpa1GJzzZEb
         qB/vx4yQIQjEXTMFoN7K+MgCpKRwVgWJjN63ihh8l3P+mspcwVSsC0zGecN9LUP2P8hu
         JDHi0uyTW8NSOYj8afPfGwi4hO56oi1c581yCLqz3KcMGTigbj8YPQag4VddSz7RxP59
         v1bX+1eG3VxkGKy3T87h/4isic7WEYfmYynhUUNYBUQETWJLp4Ybtfh5FOdKR7dQD8om
         d6oCU6u9Tsz8kPR6rW1ltgPk037SoQ3bNuuYnwJwaY0zvYU+d3pBLXc0xpQgsu0znMOM
         7ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930300; x=1776535100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQ9FMt2GgCLKM11biLesryR+G33OllgKjO21lfayfy8=;
        b=JLBsKLzd8V1N0Uu0Ll17Q6bVJgY3EiWwQu96OcF3TpKBaM0DUlz0pYQxYQxuU4jh1W
         JPbNkPCZVFwr6Lnd7gyidZrq0Rp4bT5WmGkP8Cgx3iTvP27lOpRednNKqKk8i6e7tIcJ
         SIrDiBXUIXMR3J1CBpJaUZQwAP2aSggGP4CynlJN6VFXlwCs1MnjZPLEqOqZFe1F2aL4
         r2lF3lw+bDCd41ZdKZ5+nFnpNJ5GYvrLhyuWGIqC+nE810EEnDnpR2/MJUyQl3L/h9kv
         iQA+gaPXhXyEYMaSgjW/FyUo/gOB9SddNjnm2OgpeG3oCdfpBLAKU5mI80mPe557iGsC
         ixHw==
X-Gm-Message-State: AOJu0Yy3felwiehYjxBeHCxkm9JARoqW4NPIdfzyq5nnW4AcF6M+xz7O
	Np8+owyL8nFYR0oKTHJGdtfXN41Dh5duAa3mgFvT/777x9sxS9Y8FUUv9y5zdkabhaLz7s33hS7
	PD09dNExcgn7qV9N48SqPudxFVGWWcter2ppXRPU=
X-Gm-Gg: AeBDiev08oVhTbPebEfW/+MKVXFHglSmOQPM6yhw0PrC2xJmZnErewZG6nt8cQx2OZZ
	HEwCsea+88c+/MWnTMpfeoWO3BxQnS1FE8nWUmV6NkT38fwo+KMHWiAdwacSYQt/y/dmBszqaeK
	pbb/PsjhmNaYvTRSUMe61m+wFrBJMz9NN7iHykFYYt0xSGxMWjtqccmQs3zVKyqKx1KyLfVXpWv
	XJ5If+sTojePnTqMOjazZj4WuTClIZFmUteidPw3O88vVqWtcU+0S1bPeYmSSor6LxypI0x+yrr
	o68Gda5b9eB7OFfWP9BIAW8TpkSNfkcS2VjLUkbp9/+lfLEt6A==
X-Received: by 2002:a05:6122:3a01:b0:56f:4a47:6c9e with SMTP id
 71dfb90a1353d-56f4a478d9dmr853373e0c.2.1775930300446; Sat, 11 Apr 2026
 10:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pavitra Jha <jhapavitra98@gmail.com>
Date: Sat, 11 Apr 2026 23:28:08 +0530
X-Gm-Features: AQROBzC2X93QqIGjFT303XQHdrnkn9J_7FXOpIDUFvz6B4Lnw5sv8iW1g1B5zBA
Message-ID: <CALFbBidSiJTD2zdczQ1_mxv8Xm9Pqspnz8LDppHp2hudkLSoxw@mail.gmail.com>
Subject: MAX3420 UDC: out-of-bounds read/write via unvalidated wIndex in USB
 SETUP packet
To: linux-usb@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36162-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhapavitra98@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD25C3E1290
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I am reporting an out-of-bounds read and write in the MAX3420 USB
Device Controller driver. The issue arises from using a
host-controlled wIndex field from a USB SETUP packet as a direct index
into a fixed-size endpoint array without validating that the index is
within bounds.

The driver handles USB control requests originating from an external
USB host and therefore must treat all request fields as untrusted.

1. VERSION AND ENVIRONMENT

Research kernel: v7.0.0-rc7
Architecture: x86_64

Observed unpatched as of April 11, 2026

2. VULNERABILITY PATH

USB host (attacker-controlled SETUP packet)
 ->
MAX3420 hardware (SUDFIFO register)
 ->
max3420_handle_irqs()
 ->
max3420_handle_setup()
 ->
spi_rd_buf(..., MAX3420_REG_SUDFIFO, ...)
 ->
udc->setup =3D setup
udc->setup.wIndex =3D cpu_to_le16(setup.wIndex)
 ->
dispatch:
   -> max3420_getstatus()
   -> max3420_set_clear_feature()
 ->
wIndex masked and used as endpoint index
 ->
out-of-bounds access into udc->ep[] when the derived index exceeds the
array bounds

No validation of the derived index is observed along this path.

3. VULNERABILITY DESCRIPTION

The endpoint index is derived as:

    id =3D udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;

USB_ENDPOINT_NUMBER_MASK is 0x0f, producing values in the range 0=E2=80=931=
5.

The backing storage is:

    struct max3420_ep ep[MAX3420_MAX_EPS];

where:

    MAX3420_MAX_EPS =3D 4

Valid indices are therefore 0=E2=80=933. Values >=3D 4 will index beyond th=
e
bounds of the array.

4. SOURCE CODE ANALYSIS

4.1 Untrusted input propagation

    spi_rd_buf(udc, MAX3420_REG_SUDFIFO, (void *)&setup, 8);
    udc->setup =3D setup;
    udc->setup.wIndex =3D cpu_to_le16(setup.wIndex);

The SETUP packet contents are populated by the USB host and copied
into driver state without validation. The wIndex field is later used
in control flow and memory access decisions.

4.2 Direct indexing into fixed-size array

    ep =3D &udc->ep[udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK];

and:

    id =3D udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;
    ep =3D &udc->ep[id];

There is no check ensuring the derived index is less than
MAX3420_MAX_EPS before dereferencing.

4.3 Affected call sites

The pattern appears in:

- max3420_getstatus()
- max3420_set_clear_feature()

Both paths derive an index from wIndex and use it to access udc->ep[].

4.4 Existing checks are not sufficient

    if (udc->setup.wIndex & USB_DIR_IN)

This condition only evaluates the direction bit and does not constrain
the endpoint number. It does not prevent out-of-bounds indexing.

4.5 Invariant violation

Regardless of protocol expectations, memory safety requires that any
externally influenced index used for array access be validated against
the array bounds.

Here, the code assumes the masked value is valid without enforcing
that constraint, which can lead to out-of-bounds access if unexpected
values are received.

5. IMPACT

Out-of-bounds read:

In max3420_getstatus(), fields are read from ep. If the index is
out-of-bounds, this may result in reading adjacent memory.

Out-of-bounds write:

In max3420_set_clear_feature(), fields within ep are modified
(including locking and state flags). If ep is out-of-bounds, this may
result in writes to unrelated memory.

Memory corruption characteristics:

Because ep[] is embedded within struct max3420_udc as a fixed-size array:

- out-of-bounds indexing accesses memory beyond the array within the same s=
truct
- this may overlap adjacent struct members depending on layout
- further out-of-bounds accesses may extend beyond the struct into
surrounding memory depending on allocation context

Trigger:

A malformed USB control request can supply an out-of-range wIndex
value, for example:

    bmRequestType =3D 0x02  (TYPE_STANDARD | RECIP_ENDPOINT)
    bRequest      =3D SET_FEATURE
    wValue        =3D ENDPOINT_HALT
    wIndex        =3D 0x0007
    wLength       =3D 0

This produces an index of 7, which exceeds the valid range [0=E2=80=933].

6. VALIDATION EXPECTATION

The driver processes externally supplied USB control requests and
should validate fields before using them in memory access operations.

Other UDC drivers typically constrain endpoint indices or validate
request parameters before indexing fixed-size arrays. The absence of
such validation here suggests a missing bounds check.

7. SUGGESTED FIX

Validate the derived endpoint index before accessing the array:

    id =3D udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;

    if (id >=3D MAX3420_MAX_EPS)
            goto stall;

This check should be applied consistently in both:

- max3420_getstatus()
- max3420_set_clear_feature()

8. AFFECTED VERSIONS

Affected: all kernels including the MAX3420 UDC driver
Fixed in: not yet patched

9. REACHABILITY ANALYSIS (CODE-LEVEL)

The vulnerable access is reachable through the standard USB control
request handling path.

9.1 Interrupt entry point

USB SETUP packet handling is triggered from the IRQ path:

    max3420_handle_irqs()

Relevant code:

    if (epirq & SUDAVIRQ) {
        spi_wr8(udc, MAX3420_REG_EPIRQ, SUDAVIRQ);
        max3420_handle_setup(udc);
        return true;
    }

Receipt of a SETUP packet (SUDAVIRQ) directly invokes max3420_handle_setup(=
).

9.2 SETUP packet ingestion from hardware

The SETUP packet is read directly from hardware:

    spi_rd_buf(udc, MAX3420_REG_SUDFIFO, (void *)&setup, 8);

    udc->setup =3D setup;
    udc->setup.wValue =3D cpu_to_le16(setup.wValue);
    udc->setup.wIndex =3D cpu_to_le16(setup.wIndex);
    udc->setup.wLength =3D cpu_to_le16(setup.wLength);

No validation or bounds checking is performed on wIndex before storing it.

9.3 Dispatch into request handlers

Standard USB requests are dispatched as follows:

    case USB_REQ_GET_STATUS:
        return max3420_getstatus(udc);

    case USB_REQ_CLEAR_FEATURE:
    case USB_REQ_SET_FEATURE:
        return max3420_set_clear_feature(udc);

This dispatch occurs without validating the endpoint index derived from wIn=
dex.

9.4 Out-of-bounds access in max3420_getstatus()

    ep =3D &udc->ep[udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK];

No bounds check is performed before dereferencing ep.

9.5 Out-of-bounds access in max3420_set_clear_feature()

    id =3D udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;
    ep =3D &udc->ep[id];

No validation ensures id < MAX3420_MAX_EPS.

9.6 Array bounds vs index range

Array definition:

    struct max3420_ep ep[MAX3420_MAX_EPS];
    #define MAX3420_MAX_EPS 4

Valid indices: 0=E2=80=933. Index derivation produces values 0=E2=80=9315. =
Values >=3D 4
result in out-of-bounds access.

9.7 End-to-end reachability

    USB host =E2=86=92 SETUP packet
        =E2=86=92 MAX3420_REG_SUDFIFO
        =E2=86=92 spi_rd_buf(...)
        =E2=86=92 udc->setup.wIndex (unvalidated)
        =E2=86=92 max3420_getstatus() / max3420_set_clear_feature()
        =E2=86=92 ep =3D &udc->ep[id]
        =E2=86=92 out-of-bounds access when id >=3D 4

This path requires only a valid USB control request targeting an
endpoint and does not rely on undefined behavior or malformed packet
structure.

10. RUNTIME EVIDENCE (USERSPACE HARNESS)

Hardware emulation for the MAX3420 SPI controller is unavailable in
QEMU. A userspace harness was constructed that reconstructs the
vulnerable struct layout and control flow from max3420_udc.c verbatim,
feeding attacker-controlled SETUP packet fields directly into the
dispatch path. AddressSanitizer confirms the out-of-bounds write at
the exact offset predicted by the struct layout analysis.

Build:

    gcc -fsanitize=3Daddress,undefined -g -O0 -o max3420_poc max3420_oob_ha=
rness.c

Trigger packet (wIndex=3D0x0007, derived id=3D7):

    bmRequestType =3D 0x02
    bRequest      =3D SET_FEATURE
    wValue        =3D ENDPOINT_HALT
    wIndex        =3D 0x0007
    wLength       =3D 0x0000

ASan output:

    max3420_oob_harness.c:154:26: runtime error: index 7 out of bounds
for type 'max3420_ep [4]'
    ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7c78019e0680
    WRITE of size 1 at 0x7c78019e0680 thread T0
        #0 max3420_set_clear_feature  max3420_oob_harness.c:163
        #1 run_test                   max3420_oob_harness.c:223
        #2 main                       max3420_oob_harness.c:282
    0x7c78019e0680 is located 168 bytes after 280-byte region
    SUMMARY: AddressSanitizer: heap-buffer-overflow in max3420_set_clear_fe=
ature

Struct layout confirms ep[4] overlaps irq_registered at offset 256.
ep[7] lands 168 bytes past the struct boundary. The harness source is
available on request.

Regards,
Pavitra Jha
jhapavitra98@gmail.com

