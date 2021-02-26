Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8469326902
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 22:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhBZU5d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 15:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhBZU5a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Feb 2021 15:57:30 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4931C06174A
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 12:56:50 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id n19so2475499ooj.11
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 12:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=4NltfgZTZVTcJkPdqjQ7/+K9bw+Jz6B0sQn1cG1ubn0=;
        b=OKdhqlP58PYobni8E2k/eYwIfP0jzPQQ+Io7Ra/gSnhfKXLoZDtjhFrFo9t0j5fQ1l
         Xp43NyE6hfGdEA7eRiBHJgRzdTvGFZGFcL70zzWsPqJfBMOjQc0dMkk/lzQEOP3+jL25
         65XbLZ0sAeYtGkmxNvhPbuGQEaI6HhOedx5SMjWfvnuebDoa7w6YKdkYJucSw1fnNc/a
         xeGZuXK7IaCf67rclWt09KiajbZswMnvyYeRVw2hYCer88Ukdm19E45muX2S81WSkylN
         4ZN0yxjJ/7VFyuBFqdcEbN13U/DgdPQmbIkza7c1pgjH6c/cJFHHZijWJFu2BRpxlbMD
         I+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=4NltfgZTZVTcJkPdqjQ7/+K9bw+Jz6B0sQn1cG1ubn0=;
        b=Sy9UtnBujWHLp3UQzf5C0CskSs7whmbCXBM22UeeUk30tiHILRbSNS3PJj47Tk1DLC
         slg6IHjnwNV3cGCmFTmhL0ffjvR2yuVgnsdIL6DVBlXn0SZA41Au7JSaxTEcASZNjZw1
         oZi4RnMpIV+/gc1+e7zERh9j0ME+rMXKvzNkfagwppUO7/eZ71mAP0uXGoxYpB6H7N7z
         jzdcKl9m+u9lsBrshcKVB6MW77R+gyD3p6s0jSAkGmf3wkHD18d91fWm8MAefaOLDWFY
         qmu3u6Fu5e3MQAe1+9D8ldlQTcG/umR+ovYp2mAUNMeOwBnfefBfjkGCAuYQ3d3mVxaQ
         HC3g==
X-Gm-Message-State: AOAM532g0+JfVNgt2TYEWBjBUGOaRKVXSVwMAqlNKo/JzoU0ClYEPBHB
        OCleIuHndOVvXZFRAMRu8+MdcY3tmFs9Bg==
X-Google-Smtp-Source: ABdhPJyU7toaPxfRB+GRGZ1B0AbgmhTb3xk3VvUnjilUNTmoU9IbdxVSNp9WKg1ElpgH0EglkgCFow==
X-Received: by 2002:a4a:de88:: with SMTP id v8mr3700145oou.87.1614373009930;
        Fri, 26 Feb 2021 12:56:49 -0800 (PST)
Received: from [192.168.43.12] (wsip-72-214-132-169.sv.om.cox.net. [72.214.132.169])
        by smtp.gmail.com with ESMTPSA id m11sm1860226oih.34.2021.02.26.12.56.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 12:56:49 -0800 (PST)
Message-ID: <006e3315b5b18fc8b3d0df1e3fc5a0072316b278.camel@gmail.com>
Subject: USB-C bug: port fails to initialize after an unplug/plug
From:   420actionunits@gmail.com
To:     linux-usb@vger.kernel.org
Date:   Fri, 26 Feb 2021 13:56:32 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'd like to report a USB-C bug. I recently switched from my linux distro's "stable" 5.4.99 kernel to the "testing" 5.11.2 version. A USB-C problem appeared in the 5.11.2 kernel. When a device is unplugged and then re-plugged back in, it does not initialize and the following message shows up in dmesg:

[ 5082.822133] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)

This appears to be emitted by the code in drivers/usb/typec/ucsi/ucsi.c

Booting a 5.4.99 kernel makes the issue go away.

If the host is booted up with USB-C devices plugged in, they all come up. It's the unplugging and replugging at runtime that triggers the issue.

Carlos Konstanski

