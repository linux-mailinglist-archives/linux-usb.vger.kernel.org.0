Return-Path: <linux-usb+bounces-29876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B49BDC1F1F5
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 09:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BC4F1A21299
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 08:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BC231E0F7;
	Thu, 30 Oct 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbIFaNKB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D87270EC1
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814173; cv=none; b=GOe7RYa7DbjmKxIoCj8UG4WbY9zTcJ5AndqnOHBJ/pEpGRELTiFFRU66bNs4OOcSLXO5nP09/I4I3HoO5J3U+LXu5uqvWwus1GBVhbKCMZQCNrc5wCq6iQBisJeUJ0iCRCL04cqpKSBRSDgZA9gM6hCIorLLh2nFvAVyT8bh/XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814173; c=relaxed/simple;
	bh=97+xh8ImLP/tEA3+RPuH3AE3lOTs9YOv7ABqOC5Gg38=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WRz9nVD1epV93gymO4tK4SJgc5FK+zuzZhm4mZCJu9oopNtZfl/oBxQL/aZsfkRBP+DfTD4UDzFa4G2fkrW8Nmx/H5FYWBR47cnJobxM1+VeqEMmphd2cko6hYDorR1sB6a30Bw/tOaW5vkVPwU+WLKWkPUlX2MwVHIzG86BX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbIFaNKB; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-430ca464785so6967345ab.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761814171; x=1762418971; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WaWCYhWrDY56rNLiQVNXDaD0Ljw78TikcTJINpwb4mw=;
        b=QbIFaNKBAMUeqg8E2NaYdgObA7aaveUQMF/DmRLRvK7tIVUmxcUxJnlu/y8wzWQTsN
         J5o+ylmamS96t6MCASy30Zz6VDZN4czml4Mgdph+ijww6eyYsnwaJMn3bDaXCDF8hWuM
         Gw98y8Ne88qjLgtMPQ/UkbNu03lNFb+cbJj1BbiMKP974k0lSsMuOddNuSH62fS2ITKf
         SVykOUz5yBmBcGyVYGa+qpPxyfqUeNJeLs5Dnftf9rlmWq6iAQc8XHLKWS47gGIAsBYu
         kRTsgMffuRA2f6l/FGp0tVffW9+ty1OKZ6e/fwOAhxdw1f7bVyAmuKdVA1XudNytB+4i
         Vqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761814171; x=1762418971;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaWCYhWrDY56rNLiQVNXDaD0Ljw78TikcTJINpwb4mw=;
        b=D6oFoyaBRwYL1vouS3riiOqlHRAvoVBBmIUuzH25kBFr8pgvPnXiTsaJpMrkJNUSS4
         O0FR4BBKBaK9iBMrTuUxbpadY8kONv/injlAdRpYHdGVU5/tgnhfZU89xmgGShWASqye
         3R0NVQb7LvuiNheWtC5qz046wKjAOxRNHXzsfsYcDDMMHfrbNMQwkuo0YIBqVHL28Dnv
         7ueuQvFi5jlzKyV06RJOJ0FA2t1M76kustY+RtuKPKcZKhzJSsm1Z0zb4ugFqL9DHWuv
         vITPE+ZXo6cgQ7ry/qCGmfsUXreko4aiZR7OnG/yFQdJ8OFQETLCNYrIngyR4ikwpGej
         aaTg==
X-Forwarded-Encrypted: i=1; AJvYcCVGgYNfn0y0RP8K4Zvp5aa/y+EQ8zGjUjU79CzaMVkMXWCPzP5Gu7DVGfOnko8haVVQJ5YIZY7YCuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8V42NYVqD62FGHOzzGsMs1xrXn2fPduh+2UsVdKV6TKoKiIE
	9LRJ88fOjeLb7wEfGzmX4aOFYfYse92fzu9YfEjpD+UzJyjqcPFHoKIs6VImb9SFQX05iXH28Pg
	v8pAEA4BZXPZcK7F9N5d3bCP66q53mWWrusTf3cFp33Cg
X-Gm-Gg: ASbGncvA/gzPAGTDE1ovbu34BiG9/Rkz1/YbOSF/Qvl+TzroiOlHZCTCnTVaF0gipYY
	6RFoxmJ7JYFZEbuszENTjj5AhUH/ZCNYgrmj9GccOrlzKrQRMruuFqthvlUESssGYq9q3Ytn879
	fEo9cJshBP+U+8orj11w36z+E+v8DJBJ4yBI1vqtqq8bzvX+YJYOpHGCeccN34TL7MoXT7pFEtt
	expA4L//nTgxj3Oh4K5MnKJLi3uZOslZ3aDZohenONZLBaBm1y9qNnxYRvJEsKK438BidlDVsw=
X-Google-Smtp-Source: AGHT+IEH24siBx7LuNQKPmLx8di/EwZw0d2ks5a4VKNMZFSCjtZzEbNmEHH5/L1jSF2aVtDhlSHR0yOnfKFArREpA0c=
X-Received: by 2002:a05:6e02:1568:b0:430:c600:64b9 with SMTP id
 e9e14a558f8ab-432f904b9eemr71954475ab.24.1761814170754; Thu, 30 Oct 2025
 01:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Li Haifeng <omycle@gmail.com>
Date: Thu, 30 Oct 2025 16:49:19 +0800
X-Gm-Features: AWmQ_blOr9wtwdVn_wrG4K7XdETPr-LJgR7cqzbj8t7ECYamE5H-wouXOs51ppc
Message-ID: <CAFNq8R7q-GvFgwRKewzG=ZwkbxEfhKjEsxHWXQ0q8BsSSDFcnQ@mail.gmail.com>
Subject: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
To: Felipe.Balbi@microsoft.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linux USB experts,

I'm encountering an issue with the DWC3 gadget driver on a Rockchip
RK3588 platform running Linux kernel 5.10 (from the
rk3588_linux_release_20230114_v1.0.6 SDK). I'm developing a kernel
module that uses the existing CDC-ECM USB Ethernet gadget to send 16KB
of data from the device to the host via scatter-gather lists,
leveraging TRB chaining for bulk IN transfers.

The module accesses the IN endpoint from the eth_dev structure (via
netdev_priv) and queues a USB request with 4 scatterlist entries (each
4KB, totaling 16KB). The request is set up with req->sg,
req->num_sgs=3D4, and req->length=3D16384, then queued using usb_ep_queue.

However, during transmission:
- The device side only transmits the first 2KB of data.
- The host acknowledges this partial transfer (ACK received).
- After the ACK, the device does not respond or continue the
transfer=E2=80=94no further data is sent, and the endpoint appears to stall
without triggering any completion callback or error.

This behavior is reproducible when scatter-gather is enabled on the
controller. Disabling scatter-gather or using non-chained TRBs allows
the full transfer to complete successfully.

Here's a simplified excerpt from the module's send function for reference:

```c
static int send_16kb_sg(struct usb_ep *ep) {
    struct usb_request *req;
    struct send_context *ctx;
    struct scatterlist *sg;
    int num_sg =3D 4;  // 4 segments of 4KB each =3D 16KB
    int size_per =3D 4096;
    int i;
    int status;

    if (!ep->gadget->sg_supported) {
        pr_err("Scatter-gather not supported by USB controller\n");
        return -EOPNOTSUPP;
    }

    req =3D usb_ep_alloc_request(ep, GFP_KERNEL);
    if (!req) return -ENOMEM;

    ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
    if (!ctx) {
        usb_ep_free_request(ep, req);
        return -ENOMEM;
    }

    sg =3D kcalloc(num_sg, sizeof(struct scatterlist), GFP_KERNEL);
    if (!sg) {
        kfree(ctx);
        usb_ep_free_request(ep, req);
        return -ENOMEM;
    }

    sg_init_table(sg, num_sg);

    for (i =3D 0; i < num_sg; i++) {
        void *buf =3D kmalloc(size_per, GFP_KERNEL);
        if (!buf) {
            // Cleanup...
            return -ENOMEM;
        }
        ctx->bufs[i] =3D buf;
        memset(buf, 'A' + i, size_per);  // Dummy data
        sg_set_buf(&sg[i], buf, size_per);
    }

    ctx->sg =3D sg;

    req->sg =3D sg;
    req->num_sgs =3D num_sg;
    req->length =3D num_sg * size_per;
    req->buf =3D NULL;  // SG mode
    req->context =3D ctx;
    req->complete =3D send_complete;
    req->zero =3D 0;

    status =3D usb_ep_queue(ep, req, GFP_KERNEL);
    if (status) {
        // Cleanup...
    }

    return status;
}
```

The complete callback (send_complete) is never invoked after the
partial transfer, and no errors are logged in dmesg.

Is this potentially due to incorrect usage of TRB chaining in the
scatter-gather setup (e.g., something missing in how the chain bit or
TRB fields are handled in the driver)? Or could this be a known issue
in the DWC3 gadget driver, perhaps related to handling chained TRBs
for larger transfers on certain controllers?

I've reviewed the DWC3 documentation and some past discussions on
stalls with scatter-gather, but haven't found an exact match. Any
insights, suggestions for debugging, or pointers to relevant patches
would be greatly appreciated.

Thanks in advance for your help!

Best regards,
Haifeng

