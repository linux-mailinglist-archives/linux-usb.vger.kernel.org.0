Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E16215866
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729338AbgGFNeK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729329AbgGFNeJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFD0C08C5E0
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:08 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 22so39377323wmg.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d5p91PYLOlGL5eAhTI+TgOkI4utTlM6UStiViuCSA4I=;
        b=zWvdvBnN7uGI3YJYG8xAKLYiRJh1mm0+0r6YAQ/ht+c+2n5/aaoZ24CrC6+hTOq75q
         UZgksZ/ftaNvfFjflqPGT6LMkwCqQ9dhF/YRFHAvqu+DdxqoYp7Ex3s1nB1x0kw/i8Wy
         2EWBhwE38eGBFN2TO5wcJ4Q22ru3uU3QZ8WgSOUDl0W5yggF2tD93sA22eOBatapWahz
         hIdy7n8K4yNPhE7VlJWZ1XdjDn1HYu1O7Ot1DZPO9MIdEvoyXtF65q5zuvF5LY1rfRHI
         zO4HmtSixQQmvk/yfC0Oeo3PAQMsM6lPTWYiYiuQvARvCD45XF9IVh8ATkXIOd6W0kfn
         nG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5p91PYLOlGL5eAhTI+TgOkI4utTlM6UStiViuCSA4I=;
        b=V5PXigHN7QhIb+gTJ+FkiolrChckXSCG2fHzDjnNOTvj0dMyiufp9CmJl7CovghoXE
         d1jTME/qEC4fTZAor/OZrE6/tf5Fl/Xj7VI6l7vE0A8HCi+TiLT93SdaN+0C8Y2Zw9Lz
         S/VUFYGqvWwjnBt1QxNTBW++vMNgRIIP3GQvdfE43q6y7lIjYTtgDSMOfsjZajttvxF9
         LUNrKZoTcncz0WuGsyjUHT3L9u/5R3IhsKzVsNn7oI4Su9YemzotEKNhjays5pT3yt/r
         Sz485yMjRbjHLCBnOcEughJt9pyw1koVb81pTvssKwfi/LsfOJLi1cTSSJJdWhJJsfuw
         /d7g==
X-Gm-Message-State: AOAM532C3/15DEAVhL/Xv+keMZPEo3DDq5O0mJ5lWim7z228AeqgdySf
        pdiJiUn8u0exsUFatUU8TPdSdQ==
X-Google-Smtp-Source: ABdhPJweO4LHH0YuesEFBL8qRBzNi8brrKp2TuduBLyEDI7/Vj9+MgTEjdpThiWYval39YIjbESx5Q==
X-Received: by 2002:a1c:8117:: with SMTP id c23mr47262716wmd.157.1594042447424;
        Mon, 06 Jul 2020 06:34:07 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, Bryan Wu <cooloney@kernel.org>
Subject: [PATCH 19/32] usb: gadget: function: u_uac1_legacy: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Mon,  6 Jul 2020 14:33:28 +0100
Message-Id: <20200706133341.476881-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/function/u_uac1_legacy.c:30: warning: Function parameter or member 'i' not described in 'snd_interval_refine_set'
 drivers/usb/gadget/function/u_uac1_legacy.c:30: warning: Function parameter or member 'val' not described in 'snd_interval_refine_set'
 drivers/usb/gadget/function/u_uac1_legacy.c:93: warning: Function parameter or member 'snd' not described in 'playback_default_hw_params'
 drivers/usb/gadget/function/u_uac1_legacy.c:153: warning: Function parameter or member 'card' not described in 'u_audio_playback'
 drivers/usb/gadget/function/u_uac1_legacy.c:153: warning: Function parameter or member 'buf' not described in 'u_audio_playback'
 drivers/usb/gadget/function/u_uac1_legacy.c:153: warning: Function parameter or member 'count' not described in 'u_audio_playback'
 drivers/usb/gadget/function/u_uac1_legacy.c:197: warning: Function parameter or member 'card' not described in 'gaudio_open_snd_dev'
 drivers/usb/gadget/function/u_uac1_legacy.c:257: warning: Function parameter or member 'gau' not described in 'gaudio_close_snd_dev'
 drivers/usb/gadget/function/u_uac1_legacy.c:286: warning: Function parameter or member 'card' not described in 'gaudio_setup'
 drivers/usb/gadget/function/u_uac1_legacy.c:303: warning: Function parameter or member 'the_card' not described in 'gaudio_cleanup'

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/function/u_uac1_legacy.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/u_uac1_legacy.c b/drivers/usb/gadget/function/u_uac1_legacy.c
index 5393e5c37a4ba..60ae8b2d3f6a2 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.c
+++ b/drivers/usb/gadget/function/u_uac1_legacy.c
@@ -23,7 +23,7 @@
 
 /*-------------------------------------------------------------------------*/
 
-/**
+/*
  * Some ALSA internal helper functions
  */
 static int snd_interval_refine_set(struct snd_interval *i, unsigned int val)
@@ -86,7 +86,7 @@ static int _snd_pcm_hw_param_set(struct snd_pcm_hw_params *params,
 }
 /*-------------------------------------------------------------------------*/
 
-/**
+/*
  * Set default hardware params
  */
 static int playback_default_hw_params(struct gaudio_snd_dev *snd)
@@ -146,7 +146,7 @@ static int playback_default_hw_params(struct gaudio_snd_dev *snd)
 	return 0;
 }
 
-/**
+/*
  * Playback audio buffer data by ALSA PCM device
  */
 size_t u_audio_playback(struct gaudio *card, void *buf, size_t count)
@@ -189,7 +189,7 @@ int u_audio_get_playback_rate(struct gaudio *card)
 	return card->playback.rate;
 }
 
-/**
+/*
  * Open ALSA PCM and control device files
  * Initial the PCM or control device
  */
@@ -250,7 +250,7 @@ static int gaudio_open_snd_dev(struct gaudio *card)
 	return 0;
 }
 
-/**
+/*
  * Close ALSA PCM and control device files
  */
 static int gaudio_close_snd_dev(struct gaudio *gau)
@@ -275,7 +275,7 @@ static int gaudio_close_snd_dev(struct gaudio *gau)
 	return 0;
 }
 
-/**
+/*
  * gaudio_setup - setup ALSA interface and preparing for USB transfer
  *
  * This sets up PCM, mixer or MIDI ALSA devices fore USB gadget using.
@@ -294,7 +294,7 @@ int gaudio_setup(struct gaudio *card)
 
 }
 
-/**
+/*
  * gaudio_cleanup - remove ALSA device interface
  *
  * This is called to free all resources allocated by @gaudio_setup().
-- 
2.25.1

