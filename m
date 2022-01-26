Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD4E49D3DA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 21:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbiAZUwh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 15:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbiAZUwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 15:52:37 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8F8C06161C
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 12:52:36 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o30-20020a05600c511e00b0034f4c3186f4so4538211wms.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 12:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SF6zhPcKhoxZqHi04jVkuhfpQWVNnuWvLbbIWpA1cBQ=;
        b=hw7p096T9NWcTMJSEK0D97o0OaQoXCaqSpXno1bl1HUEe8gD2l5yTsACgk/VCdWNLG
         DhymikxrqjvALk1J4LJDlc/YIcrIfz8KvEuIDSImTTQs4nuzogXU9I//OdZ1LH1GTifv
         SJ2JYN+LOMCx49727pRQ+AgN+N+X4BoQETge/Rx+BMAiztskyX7v1oARz3+ZX9C2528t
         SOdUvRFeG+uwh5wmvPKLsrwyeltdDNY1n9EKS3sjwSYMzX9C9fFoV3gEsUGK+C5iJ184
         xiDErAFlWgxBJtUQA7YgzisU+m58F3vypimGj5bwzKHhD0h9TTRAMjnF5Ef9TxprXDLY
         3Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SF6zhPcKhoxZqHi04jVkuhfpQWVNnuWvLbbIWpA1cBQ=;
        b=UdF487BlCjYyVdbt20BUCD0IfkJ9J2+bINyBgKLwSJOFloRi4WROVRnsBEuRDuQeFV
         EPdruBX4zyzNbMrKjRcseb5mvcE+kVAUkbgaWGoNZHG17HTlAUn3O73io204uE2ME/+X
         9IQ39n6m9eIVWPc3McvzQ7mu3L1JGNa3+DIAKm+Tl5Fh+duiyW6FL/5wDPkDb+ujgbRh
         bT89Jwfe2B4mlfN08TNJ+VX9E0YQ3EL591yEzbHWk5KTjk6AKOgLZhTE+c7lUClHKnCM
         qTms/WqbaMVGwEIZfGVHlBsgRewyD4DUDQSWhtMMSZ+5/whA5jUsATUpLJFTqmhb3LkV
         Mltw==
X-Gm-Message-State: AOAM530RhYV28zpKEMoCW1T2ojaQ4TrrvnThfYp6zuho4gcUqYa8D/Up
        b/6HVCUt+rzDiD104pQ1FnVpdkog95IS/Q==
X-Google-Smtp-Source: ABdhPJxOXWnr6Mzv4CRIP70qHZcdPEftwXA8x7moIaCkf7j2PHz/IKF3Q49EntNuj0r9L6TLIIHTVg==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id e23mr422644wmh.65.1643230355068;
        Wed, 26 Jan 2022 12:52:35 -0800 (PST)
Received: from localhost ([2a02:168:96c5:1:55ed:514f:6ad7:5bcc])
        by smtp.gmail.com with ESMTPSA id j15sm339830wmq.19.2022.01.26.12.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 12:52:34 -0800 (PST)
From:   Jann Horn <jannh@google.com>
To:     Andrey Konovalov <andreyknvl@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jann Horn <jannh@google.com>
Subject: [PATCH] usb: raw-gadget: fix handling of dual-direction-capable endpoints
Date:   Wed, 26 Jan 2022 21:52:14 +0100
Message-Id: <20220126205214.2149936-1-jannh@google.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Under dummy_hcd, every available endpoint is *either* IN or OUT capable.
But with some real hardware, there are endpoints that support both IN and
OUT. In particular, the PLX 2380 has four available endpoints that each
support both IN and OUT.

raw-gadget currently gets confused and thinks that any endpoint that is
usable as an IN endpoint can never be used as an OUT endpoint.

Fix it by looking at the direction in the configured endpoint descriptor
instead of looking at the hardware capabilities.

With this change, I can use the PLX 2380 with raw-gadget.

Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/le=
gacy/raw_gadget.c
index c5a2c734234a..d86c3a36441e 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -1004,7 +1004,7 @@ static int raw_process_ep_io(struct raw_dev *dev, str=
uct usb_raw_ep_io *io,
 		ret =3D -EBUSY;
 		goto out_unlock;
 	}
-	if ((in && !ep->ep->caps.dir_in) || (!in && ep->ep->caps.dir_in)) {
+	if (in !=3D usb_endpoint_dir_in(ep->ep->desc)) {
 		dev_dbg(&dev->gadget->dev, "fail, wrong direction\n");
 		ret =3D -EINVAL;
 		goto out_unlock;

base-commit: 0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
--=20
2.35.0.rc0.227.g00780c9af4-goog

