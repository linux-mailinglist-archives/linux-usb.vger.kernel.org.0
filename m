Return-Path: <linux-usb+bounces-35663-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFA4C6drymnG8gUAu9opvQ
	(envelope-from <linux-usb+bounces-35663-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:25:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3535AFD5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E81A301F402
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 12:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB603C3444;
	Mon, 30 Mar 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbxoKiOw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73383002A9
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872972; cv=pass; b=MSNvlP1O0wkHWQLpx5+SL7dwwLC+KJANFsZUkfpbISfgISoK9EgjNUEKDgHIuoLDGJQEFMoDT8ctz02wEKIOwpCj9tdliXfY+wzQs4P7IB2YMtAxanuKllyek90/xTN80AWmqPl4lQcR1GQMplgoIahikhQ/I2cYA805laUCkDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872972; c=relaxed/simple;
	bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLu3MkS2udI7VVWO2rrzlVykq0enLt5IzecgA/u64GGR1oTMfz+RH0urA7REgHV1zLVj6S0CqT2x6+XogZccu2GXih7Y7aOhPR7bq7XzDR/5Y8sTColmaK02REe99in++sVjTS0wE2EGCuBHj+uR0XFPy+T3dMU6WVkos8QguFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbxoKiOw; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66b8110361fso3492848a12.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 05:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774872968; cv=none;
        d=google.com; s=arc-20240605;
        b=HFxZ1tiwZsf9NGwmGQm5nyzOqghvOnDf4gv6XwBNTKvX7kjiDRsmjUffmL2kzgurRf
         2SgQyuzOXzU7hnNmNRT/tuWYoud+0DgCuwM6higFuMtFzHY2bGzQV9wnKwj735am9uMc
         6AqyWe5K8rGIBTAAlG2BJBjGxxBO8YMAuWny+ZKVKxRKixG4A8WXvVR6h/I0BUwz6z6w
         AyJqxDhMmEQSBm0DYUMgqW11mLqqAus7Aat+yX37LKxT6b4vElUW1nI9L2kxo1LTjASN
         903Kwn2l2CNjLOKNAAP2jaxqgAL39QZRNEGjn6HfbdffqmywBlumbxn/niRrZc3MtbUX
         7oeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        fh=XBxVRYcciHHSZfoOqiSuN2C7VAk/fAhsJCUl7EPP57g=;
        b=Fq5cz+k3g4k1g6WAXUnZFKQYLuSTfNugU1T9FcXMTHT20nr+zpKozcgjoRem4bLSdr
         kZB/sCV9Hw1XwIXqxFlPn509nKJfsqFGifDxApwCM0sIrZ9n30Ksu0gwmEBhYUgWdWuv
         ybQ/pfcDuH7cPQ93G2/RmRdkqKsbMxOd2wOmlCv4fFK09zn6nkJCh1EK4Zu15fzJU/34
         qjSOvf1RNNj3zxSg3BddHbqy7XL3bAlOgUVv+tIZ6sF22JGlvv6iiMYknah078UvgbN1
         Bx4/JAuWMiQQx3oGpfRA3pu0f1FjjqLDy1TBSvTX6yRGC1tf/ydC/JOjkHdobTRwybBa
         8iLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774872968; x=1775477768; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        b=MbxoKiOw2E3z4H735hb3ucZUfJXuKIb5HuaCPKjsrwoDcWk54dbFYUHXTitAsf34Ec
         1lHIrD+sWKbZt3LFWx6ayb2xHsiS5ChVKtNe6v1jYVU1hXEAfN0ROB0ZjOQAD/QcSfCW
         PeUXohDcqDmvAJwyJge4QnjKq+f0OCrv+l0M7xUR4ZcSfWaUKB+KJyXyn5ariIeBRUOT
         yBfAVeUM+PUXBGd1iUreNkkBV9h6Q1txuKPoA5xssYxFxzXzBfZdHafx43/ar762WWZ9
         MEg1jF6pNmTQeHzXBqvCx3J4YH92Bie+MV69WXUP337ivoJCfHpOxuw695cpZ9ZuS515
         G3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872968; x=1775477768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        b=GZ2coy42sryvfFW08ixf1fMxSiURqnVtJlbewmQ9XuUe+qemiJak5ds/GYeqmn/KNv
         10rZy3h0/PDZzLhNQ9XZk/VBhihuzOsFUqS8tNR7HygF81ehuOk04FPWg+xWS+di0T57
         ekkMa/iDRCVWmaz7t5xB4mluwcdoGywhPoImx6TBNyw1Cj/1vXlYc4AxGxczKS/wR3Qp
         9Mwnqz3K3qzIUjppQRrFU1oASPm6aIcG4qd6ZEChU3u0TPpRSQ0AnMn7KfPAxe8E53t4
         scPcjgoOq/IcFlh4esbBUzqnr/pzSq106UP7TQOMImakdSWKe3UMUKzLQGp2BN/eLfYQ
         9d1g==
X-Forwarded-Encrypted: i=1; AJvYcCV+aYvFdHq6D2R0NiOB8x3V4oBuac5w+WeXlcvfqr5V0n1blxo6T+KoH/ZXH2EsCRtpN8l1jhRxLYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw18Zsc25iZ7EhzQRdO48ETIpiY/GS3PF31x/44FUBQCemUOlM5
	os6n4Oy043mV9bM68SLSZ8XgdZ0EU4pnlZCmfz2gHnL3lQILayJHdXKuC85DbDOgoTAdqtlp9g/
	u+13oYyK0XMj/cAlpcpz7mYXlmkYRaz8=
X-Gm-Gg: ATEYQzxfPqcJHy1o0IXQtWDIOFh3gG3D/2zCtPa6sqwfKqv1/aIn7PRbs/NdosOx3V7
	bgdkOtitDR1cZpyWTussJqqHeex5i8Tq6bprI3PR6CjJNgWUpIJYCoIZ3CJXSYIhN9E7TTkbaGz
	ftf8hyQp6EBo0IZMdbfAdXio5zRI68Ec/5vN4g4h38DEOgobdDkn5vH9CoKGsfLSqnM5Uktq3MK
	m18D65IBkbMv1mtSPRt7wKT3gRrk4WvMcIP1U3x+6//8PO3BPWu8BP3FGT6qm6Mz6XFO+XQzjhC
	M3y6aw==
X-Received: by 2002:a05:6402:280d:b0:66c:167a:30c2 with SMTP id
 4fb4d7f45d1cf-66c167a31f2mr564738a12.8.1774872968093; Mon, 30 Mar 2026
 05:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn> <20260326100010.3588454-2-amadeus@jmu.edu.cn>
In-Reply-To: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 30 Mar 2026 17:45:51 +0530
X-Gm-Features: AQROBzB-LqUMsU7GjSBa2raN-d9hzLimLXCwAQc0Z2nOV4SZWTpS5pDRv4Qty3w
Message-ID: <CANAwSgRO+mXtc09D=iVb1kvMHpkdekiwErRXZGoLYrwNtMSZqA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Yixun Lan <dlan@kernel.org>, 
	Ze Huang <huang.ze@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35663-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4DC3535AFD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

hi Chukun,

On Thu, 26 Mar 2026 at 15:32, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
> through a controllable regulator. Add support for the optional
> vbus-supply property so the regulator can be properly managed
> in host mode instead of left always-on. Note that this doesn't
> apply to USB Hub downstream ports with different VBUS supplies.
>
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

