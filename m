Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B35479C49F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 06:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjILETi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 00:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbjILETf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 00:19:35 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52B610CA
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 21:19:30 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59b6083fa00so37957677b3.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 21:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694492369; x=1695097169; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8bQIDDMeJOvnkHBSHpviPM53nQLzWxLl8V8lczrc7P4=;
        b=vcnTIcnQs09CNgXh4Yr6/iN9kRK7a4j413YEvYescMwBWS9B3hAvMO+CFtRe4v+9l2
         z7WqqwAV+bvOU96/UrJUHerBWEEGwU4BpFON14UL1cpNe48hpa9I/0wVa+VKamDTpqW7
         M8dAakBs4mbXcSniTkb+WzxqfH6jMVMRzui2umdP2I27/CGN9LWM80eY1wSRkPXo507N
         YxlTv2J+jMS6XbSMBDv/aESh9Ch6PAqC8RBhBT/IxHPDvDk7AiEMzZLspa+KSQI4aPSx
         G+rkcJgANtRBeCu4mYPSP2vmXo3xnK4Q5MIxnsYFUpSRZQsqMEF3er9vK1XtbXECEhbx
         p3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694492369; x=1695097169;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bQIDDMeJOvnkHBSHpviPM53nQLzWxLl8V8lczrc7P4=;
        b=am3K3lB922X4lR3NFBo+oeAFNzzw2e6OWeuAztCZsD2tWjrG7KZkg+ZiLABA4WBo70
         Q2OgA7K9AQwXGumitfcA/fwsxj5JPcM72L7Yfq4C4QahkAF5PdGso5cQT/+3A4Dcicb8
         uqxHEC3akP8jmuOx4g4zrXpQaQXvp2tfgEkoqQhxEhp3TAGZ7lHQuC3QUGPLPponivqu
         fUzjXwo15RmOv+c/WGi4rMCXgxnpTGtNvcbrcX2jxet0CAPrw8wTOxW8Vdb7rHr0ZVZ5
         OWbyJNLkTZbBV17Y3yHJPQzrfO8UYLlJA9ezsnTA7QkGrY9tE5UVdhULYbZY5zrNrCIh
         +Dcw==
X-Gm-Message-State: AOJu0Yy2kIKYd9S3XUP7ZBKPjZd7jsBmf7h2ZrElfPof2pYVIqbJ14Fl
        E+0QCbN/t5dThczRx5YnmNWn5yh6RlDl
X-Google-Smtp-Source: AGHT+IH5Q6+ZU2OyNHaxHNWOUFrqc2SVY3WLdBjlE5/6CVJSmUp9U2Mk6zQFcS1q8cYySIWsvuEbsGlM3/R7
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a5b:1cb:0:b0:d77:ff06:b58b with SMTP id
 f11-20020a5b01cb000000b00d77ff06b58bmr258526ybp.10.1694492369636; Mon, 11 Sep
 2023 21:19:29 -0700 (PDT)
Date:   Mon, 11 Sep 2023 21:19:08 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230912041910.726442-1-arakesh@google.com>
Subject: [PATCH v1 0/2] usb: gadget: uvc: stability fixes when stopping streams
From:   Avichal Rakesh <arakesh@google.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avichal Rakesh <arakesh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have been seeing two main bugs when stopping stream:
1. attempting to queue usb_requests on a disabled usb endpoint, and
2. use-after-free problems for inflight requests

Avichal Rakesh (2):
  usb: gadget: uvc: prevent use of disabled endpoint
  usb: gadget: uvc: prevent de-allocating inflight usb_requests

 drivers/usb/gadget/function/f_uvc.c     | 11 ++++----
 drivers/usb/gadget/function/f_uvc.h     |  2 +-
 drivers/usb/gadget/function/uvc.h       |  5 +++-
 drivers/usb/gadget/function/uvc_v4l2.c  | 21 ++++++++++++---
 drivers/usb/gadget/function/uvc_video.c | 34 +++++++++++++++++++++++--
 5 files changed, 60 insertions(+), 13 deletions(-)

--
2.42.0.283.g2d96d420d3-goog

