Return-Path: <linux-usb+bounces-19073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF1A04231
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 15:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACCB168DEE
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 14:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F2D1F63E0;
	Tue,  7 Jan 2025 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jE3F2i7f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7BA1F6663
	for <linux-usb@vger.kernel.org>; Tue,  7 Jan 2025 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259411; cv=none; b=LtUM7f7+HhqJkqbCZXRqRQX2i81qN1vVPTH+AOmCfU8aHPHHyhq2FzeWlbFOv+S7QmuMCgqcroz240SH3LTpQnr9MghMOZahWs6S2/4zKSyphBZLbsHW0rnU5SpkR/QADDqImuuAKEhXAFhRW0Nm+1nxwgv8iM+1B6B3UqgGYW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259411; c=relaxed/simple;
	bh=GN1ru0II5d0jNYS3bWU+385MWPgbklQtaykGkLBL+II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sd9mB3FoZVhTFS1vufueSuZ7aJH384A7fnL5eC74qxnD4i1w/2rkpiVUnVWTZFDMSDw8vObncXTw/EB4jmT9bC11OUftQiSEl6SulBYv8HrFYruqEjCgMfE+P33dt93OAneSPUDxpqsRMh/dIfxC/k5/bw6sP4HX4bSqhegQHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jE3F2i7f; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385d7f19f20so6898310f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2025 06:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736259408; x=1736864208; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ho49yMjD3d/Wa48bZW4qUo+OmXMw93FJHm2TNy6f/iw=;
        b=jE3F2i7fs1MWWTlREYdfwtR+P8c1JJpLbjKwNjlU5ec4axM9YBMJwCeGK4pFNjazHR
         aI2kTBeisM0ZZN4EG48sX3FfZOYxmCzoYK3K4fuBsIdjjA9GU6R5ed5O9mEM03j2ix17
         zvL7W1v/QG2YIPdY/lkHyLLlaHpbIC5SYe+bUSuoc5dEipKYZKgZuHWoJ0eABhGxYBQx
         KuP8jUyBUlQiOo74cdc10XFlrUfsnwuMhumWYIQ6h9FMQJ5OTEf5f1kqqUOb/5cRW9jW
         6gHivlU/JWUVgZMF8FjN4gvAoLyMHASSEkQbCKKjwt2PxGy0hrSc7M83QJB3v7guVUf3
         EJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736259408; x=1736864208;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ho49yMjD3d/Wa48bZW4qUo+OmXMw93FJHm2TNy6f/iw=;
        b=NT5akq60eNWzJ6hkwn+oxJBw4oLoTU0ad7M+rE1/4WnQjhNSuMj+1UF4sJ7v3BP5y+
         OiZF5F8ta4kswjdnnuA/ljtmaaD90ZK1wtBCAqnPD8Bzawl+mzLDwNdNC58tO4YT+WNc
         tMm3FkBsWcezMSv37qeQGcaxOyP+jXSf3O5m8aF0B9eCnCTtHNeJFknuCmTn0LRf4oWq
         KfZjpVAk0g/ofDfY5ksL2FMIgLRonPOMQwGIM4QL+XFLMi/r7x0R8Ppsx5D99k82qLGn
         hJURwcmVSN+9z3nVd7jttObQGjcgYv/RjK6EVQA9KNyVktMvZ6f57DLF0U8uUDzeavoL
         4TOQ==
X-Gm-Message-State: AOJu0YxquInBiKdXsL0dEYXcoYWIdfFCw5V4RpPOvDhvYC/2VYLIyTpd
	ffpd7g+ls9f8RMmpnTvZNRY5qKLXojAOqYSo9onrAIlnQy22l3g46QvwahsZokk=
X-Gm-Gg: ASbGncuMvRtrhasAlQNqBnjF9LreQkgZcvPVYnJB43ZGVXluJOJIPhFuCau2ZiGJ/mk
	R7CdlhT5v2/sC2sTMY+ZcutSg5yL7Edpa41uZ3GEPJhlNfMmPkiJIz7nMGue2W8n+vWb9hzPxY8
	fgNaVFPyIHqvNDg5PBsyHu8oI7RLPHl6+hmZXy+uo7qYptGItRcrk4kwrfko5OpykHGBqiAVIq6
	B/QKYHF9RNwFJFV/gInBahh/9c/OkMARDwkk6U07NWqCW5DnCLWZzKZhf9Vjw==
X-Google-Smtp-Source: AGHT+IG6DOo85g9AuG/GuaHr73Xv4lzPMRjhKlTBOZTsK3UtN71QOOX4JzCR9PjfRKpFQxNueViuKQ==
X-Received: by 2002:a05:6000:184e:b0:385:dd10:215d with SMTP id ffacd0b85a97d-38a223fd770mr48424401f8f.44.1736259407860;
        Tue, 07 Jan 2025 06:16:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e26csm51304982f8f.78.2025.01.07.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:16:47 -0800 (PST)
Date: Tue, 7 Jan 2025 17:16:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: Add driver for Thunderbolt 3 Alternate Mode
Message-ID: <48dbbbab-3d09-4162-9d76-74c9baca6603@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Heikki Krogerus,

Commit 100e25738659 ("usb: typec: Add driver for Thunderbolt 3
Alternate Mode") from Dec 13, 2024 (linux-next), leads to the
following (unpublished) Smatch static checker warnings:

drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn: why is zero skipped 'i'
drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered() warn: why is zero skipped 'i'
drivers/usb/typec/altmodes/thunderbolt.c:153 tbt_enter_modes_ordered() info: return a literal instead of 'ret'
drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() warn: why is zero skipped 'i'
drivers/usb/typec/altmodes/thunderbolt.c:354 tbt_ready() warn: 'plug' is not an error pointer

drivers/usb/typec/altmodes/thunderbolt.c
    66 static void tbt_altmode_work(struct work_struct *work)
    67 {
    68         struct tbt_altmode *tbt = container_of(work, struct tbt_altmode, work);
    69         int ret;
    70 
    71         mutex_lock(&tbt->lock);
    72 
    73         switch (tbt->state) {
    74         case TBT_STATE_SOP_P_ENTER:
    75                 ret = typec_cable_altmode_enter(tbt->alt, TYPEC_PLUG_SOP_P, NULL);
    76                 if (ret) {
    77                         dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_P]->dev,
    78                                 "failed to enter mode (%d)\n", ret);
    79                         goto disable_plugs;
    80                 }
    81                 break;
    82         case TBT_STATE_SOP_PP_ENTER:
    83                 ret = typec_cable_altmode_enter(tbt->alt, TYPEC_PLUG_SOP_PP,  NULL);
    84                 if (ret) {
    85                         dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_PP]->dev,
    86                                 "failed to enter mode (%d)\n", ret);
    87                         goto disable_plugs;
    88                 }
    89                 break;
    90         case TBT_STATE_ENTER:
    91                 ret = tbt_enter_mode(tbt);
    92                 if (ret)
    93                         dev_dbg(&tbt->alt->dev, "failed to enter mode (%d)\n",
    94                                 ret);
    95                 break;
    96         case TBT_STATE_EXIT:
    97                 typec_altmode_exit(tbt->alt);
    98                 break;
    99         case TBT_STATE_SOP_PP_EXIT:
    100                 typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG_SOP_PP);
    101                 break;
    102         case TBT_STATE_SOP_P_EXIT:
    103                 typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG_SOP_P);
    104                 break;
    105         default:
    106                 break;
    107         }
    108 
    109         tbt->state = TBT_STATE_IDLE;
    110 
    111         mutex_unlock(&tbt->lock);
    112         return;
    113 
    114 disable_plugs:
    115         for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
                                                ^^^^^
These should be >= 0.  Humans are bad at counting backwards.

--> 116                 if (tbt->plug[i])
    117                         typec_altmode_put_plug(tbt->plug[i]);
    118 
    119                 tbt->plug[i] = NULL;
    120         }
    121 
    122         tbt->state = TBT_STATE_ENTER;
    123         schedule_work(&tbt->work);
    124         mutex_unlock(&tbt->lock);
    125 }

regards,
dan carpenter

