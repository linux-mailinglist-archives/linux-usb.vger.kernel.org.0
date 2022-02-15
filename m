Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B244B770E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 21:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239292AbiBOSWS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 13:22:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236762AbiBOSWR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 13:22:17 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADAB119433
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 10:22:06 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id i62so24992027ioa.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 10:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=N8lffARva8AUjhNmcIem8/yhryRPGbgPr4I4vKv4iZU=;
        b=xoqOuEmlurEBAh7hsyg3JdbuYdQBDxBQPCxuZ4GYuEkH08WiMo4Mnj5Q9gOffupNVs
         C+XFSN4fQPBzBueTh5typDjXEZ1hqwlgP/CSApofsKYfoB+9pc4f0uA8pR5bBAGx7RUD
         u9A+Unbkiu7+7T5zJj7vonzxIQELIm0xGxbzQMQfAySVSjszzCoTF4UfykYDvrqUtnx3
         9vZ55DBn78FdwRuGKa4hwgCrkjZyHP0M1DUq2BiP+zwmE3mmRiuxZ8Ohtwcm596KVmzi
         bc7kOj3lzQwb425MtvheHM2SfbCwYPPZis7aA/B7qOGp5XNjZvK0Q3B0sFtyXFZdpe2z
         OFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=N8lffARva8AUjhNmcIem8/yhryRPGbgPr4I4vKv4iZU=;
        b=UO6luWpcO8V/WBdybXMhpJogf04Gvg6oPLKSTOfxn9tvN+PVHkmf+HycVugoKVPTVf
         ohnAwaRAd06gAko1jA5d+zNWgH8HEGbr0xLHjr8MVzX8cEnLmIKXbn3z+ATKr5J4yWKk
         RPrJELzXmOjdrm0AJFZIs/u0m+QMQCKcjVK3LHGG3pqATZz2xpylHCLqh0GneOcZnMTK
         CiCOCU7XT6N52aSC7WImL5GKhQfe0o1a1V04fJTmsVQ9RW7/1W9M3OpHqvygrqmpu4IP
         IDp+IpLLcXZRAHDnxnrj7sXYxWG+d+GrtjjG47tpGZ5YSM3OgP3Z2hNTelT2nP3ZfHmp
         HpKQ==
X-Gm-Message-State: AOAM530Z2u0ImdkNmeeeKG8V4p9/QOgBKeUtPdeWa+E27EQ4P0uv6f14
        GOoyvz1UEQWFjXrdsWrFwjyRAA==
X-Google-Smtp-Source: ABdhPJxCNsT+FRKu3WkM4M10HW1yuVivlwF5YmW3Q74Xigt7ShW2zoGcGwH1pzGCzQ4byStd7q6+xg==
X-Received: by 2002:a02:3f42:: with SMTP id c2mr104978jaf.161.1644949325774;
        Tue, 15 Feb 2022 10:22:05 -0800 (PST)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id q18sm18761446ils.78.2022.02.15.10.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 10:22:05 -0800 (PST)
To:     heikki.krogerus@linux.intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] tps6598x: clear int mask on probe failure
Message-ID: <e6b80669-20f3-06e7-9ed5-8951a9c6db6f@kernel.dk>
Date:   Tue, 15 Feb 2022 11:22:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The interrupt mask is enabled before any potential failure points in
the driver, which can leave a failure path where we exit with
interrupts enabled but the device not live. This causes an infinite
stream of interrupts on an Apple M1 Pro laptop on USB-C.

Add a failure label that's used post enabling interrupts, where we
mask them again before returning an error.

Suggested-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 drivers/usb/typec/tipd/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 6d27a5b5e3ca..7ffcda94d323 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -761,12 +761,12 @@ static int tps6598x_probe(struct i2c_client *client)
 
 	ret = tps6598x_read32(tps, TPS_REG_STATUS, &status);
 	if (ret < 0)
-		return ret;
+		goto err_clear_mask;
 	trace_tps6598x_status(status);
 
 	ret = tps6598x_read32(tps, TPS_REG_SYSTEM_CONF, &conf);
 	if (ret < 0)
-		return ret;
+		goto err_clear_mask;
 
 	/*
 	 * This fwnode has a "compatible" property, but is never populated as a
@@ -855,7 +855,8 @@ static int tps6598x_probe(struct i2c_client *client)
 	usb_role_switch_put(tps->role_sw);
 err_fwnode_put:
 	fwnode_handle_put(fwnode);
-
+err_clear_mask:
+	tps6598x_write64(tps, TPS_REG_INT_MASK1, 0);
 	return ret;
 }
 
-- 
2.34.1

-- 
Jens Axboe

