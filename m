Return-Path: <linux-usb+bounces-1251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC27BD1FD
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 04:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6958C281457
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 02:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F070443D;
	Mon,  9 Oct 2023 02:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fp6+8VXQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D72E631
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 02:36:25 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A970B3
	for <linux-usb@vger.kernel.org>; Sun,  8 Oct 2023 19:36:24 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-79fc70bf3d5so16388739f.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Oct 2023 19:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696818983; x=1697423783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8Y/gC2ZU8lIowDp4uB5jkMKCGZrUswlojSZthU/zxU=;
        b=Fp6+8VXQu4UwnPEOOhcD1hrIx0ayORWyfO2HfhiahvNWoWSwV02asVz6Jn5UUt3/FE
         tzR9/CT7UzcDSc/zenGbr9XW1eh57sy+sdvSsOU9M907IIprlvDgFABfKdbaXH8g18E1
         P9yC7piXXWW/SRmTydqBYqk4lFcK8YmdFoqRCM9jcOeHpNYhWh1wb/UrZjNiVPOvG3fE
         SOql/la7EzgZ/xD9EJzmSm0Xw+/Gx0goDDJv2lCdC7j1E4yn6/RDokddpQck/NtZuDm9
         0nAOUIKsWKZZqJZLCc4IT/JKjNdhfWemRdnc2U6JReeenr8hlDU6dAfpCinfFG6i672f
         JoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696818983; x=1697423783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8Y/gC2ZU8lIowDp4uB5jkMKCGZrUswlojSZthU/zxU=;
        b=bCdiiYq2ZLugeurF5aVH8z5xGYY7ou59uYR+dFKEqfymgXWlGL19+TxAzS7OiMylFT
         fqnyIMFQBr+beLuS3Lp9fu85qrVtunHM6/cpILjzuD3CEm/s9XX5LeT8R3dj3n1cm/ka
         d7CUNZbKgafP0Xm+mxrMgmCU/326wsZk/n1vr25iKA27oQeemhHbj+skoa26wsL7Kr69
         WJsGvKhZ+5bIAvYaBvWiY7UIsoBWMdnGaXgH/kY7BNeyUYj3i2zCfS98ivX0xv8BLL/u
         wsGFNNcYps1hegOC/T4w/LfUTU4pSQZm0NdSWrJAF1sRmdFJnb4lg8j3mWeWwBANDPQa
         R/Bg==
X-Gm-Message-State: AOJu0Yz5q1KXssN+N+zUU3lulVVF+pOAyUg1FniNJKNeoc+zKaSghcZJ
	0d9UgpZygpLL2gL6Cb6mQT9mpvkD9T8=
X-Google-Smtp-Source: AGHT+IGhTO/VKC4aRiv0adCxMPr6xQjHlEWFRNRANAKz+lMBgCRBw70SV6exa6/QElUkn6gt3/9m2A==
X-Received: by 2002:a92:d14a:0:b0:349:983c:4940 with SMTP id t10-20020a92d14a000000b00349983c4940mr14551167ilg.1.1696818983212;
        Sun, 08 Oct 2023 19:36:23 -0700 (PDT)
Received: from epislon.kloppenborg.net ([2601:281:d47f:ffab::18db])
        by smtp.gmail.com with ESMTPSA id m11-20020a924a0b000000b00351375f30b4sm2637583ilf.51.2023.10.08.19.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 19:36:22 -0700 (PDT)
From: Brian Kloppenborg <bkloppenborg@gmail.com>
X-Google-Original-From: Brian Kloppenborg <brian@kloppenborg.net>
To: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org
Cc: Brian Kloppenborg <brian@kloppenborg.net>
Subject: [PATCH 0/2] Enable modem line status events on cp210x, add support for PPS on RI pin
Date: Sun,  8 Oct 2023 20:34:23 -0600
Message-Id: <20231009023425.366783-1-brian@kloppenborg.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Dear Johan,

This is my first patch to the Linux kernel.

Patch 1 enables support for modem line status changes to the cp210x driver. This is required to receive pulse-per-second (PPS) signals from GPS receivers. Support for this feature exists in the FTDI driver, but is not present in cp210x. The patch is implemented through (1) enabling the device's event mode by default when the port is opened or closed, and (2) registering the CTS, DSR, RI, and DCD changes with the kernel through conventional means.

Patch 2 enables support for GPS PPS signals on the RI pin. While most GPS devices typically expose this signal on the DCD pin, the Adafruit Ultimate GPS with USB-C placed it on the RI pin instead. So this patch is highly focused on that specific device. From what I can tell, the usb_serial_handle_dcd_change function is used exclusively to register PPS signals with the kernel, so calling it from the RI block shouldn't result in unexpected behavior.

Please let me know if you require any further information.

Regards

Brian Kloppenborg

Signed-off-by: Brian Kloppenborg <brian@kloppenborg.net>

Brian Kloppenborg (2):
  Make cp210x respond to modem status changes (CTS, DSR, RI, DCD) by
    default.
  Make cp210x register GPS PPS signals on the RI pin.

 drivers/usb/serial/cp210x.c | 71 +++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 11 deletions(-)

-- 
2.34.1


