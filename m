Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04216447FE3
	for <lists+linux-usb@lfdr.de>; Mon,  8 Nov 2021 13:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238622AbhKHM5b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Nov 2021 07:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhKHM5b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Nov 2021 07:57:31 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AC0C061570
        for <linux-usb@vger.kernel.org>; Mon,  8 Nov 2021 04:54:47 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id l43so31216143uad.4
        for <linux-usb@vger.kernel.org>; Mon, 08 Nov 2021 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shantur-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=tqBXpdjlkGsDuc1Y6WS8QM/trNXnRinAXSs/YJPLSD0=;
        b=m476Waeh5kj0l9ULHGrykIPCkYk+5zJw4O76WCQAMXDFExXdZpnbPC+gXcqgtHeakU
         Hzi0b4Lipt/LOz7xuEIxFMD9pC6mdawMFI4COIyBloy2IvvJQsCSLwQonzlidxGf3J9m
         aFYTDnKlOeWTOLMamLMap5YOOkHHN54t6pesnMBZOe7Cz3SGnKTZ8OO3qOQHya4kxMlR
         pgw4PEC+zgoJ86v+HgE2HmnkWtTsH+MopIU+Fu6FxxrQVMa8gMyzMSA8+3zhSFEbvjib
         cjegqByUQ+CUBVURZypdEH5gUlXm4Z0WdDN8ZF3kkQUxa10O2+wuB5EDTi1HkM7aCHI8
         47CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=tqBXpdjlkGsDuc1Y6WS8QM/trNXnRinAXSs/YJPLSD0=;
        b=pne7EAa+p9k8L7YNgtys0uXu1QdzM/LopYNaQ49sgV3kII5OEe1FvwAQebf+FSBsf7
         encnxMji8kC3c8XOtgL64udA1KAi9hAzeztl94Qg3FcwZrd3jw4mZ/pr4zwUQg9tG+VZ
         OXffUKEATLWBlsdatQJbBVYtkWhvbim9PY/ScNP0LNl7mkXWqa363c1WnjJnwOw8znsu
         LS7c55wgCVYujvA83fRxL/hzkJ+QAVkYc6YSmkJkYKmT6JEQDWs0PCceWhyngROvAAHO
         BznmoMT9mBu0YHb8ullNAEHymL/XsRVuPuGidJSpBwxpG6q8AKiWhSbvVSLyXYuUXlVS
         sf0g==
X-Gm-Message-State: AOAM5315nejubXLyJGAiJMZBA3OgzlYoXk4LzOed1vlzs/nV8zqwkmck
        xBPleGtYTrug1seYU5toKBatPAJnGLHWYi4rb28uzBXmnYo=
X-Google-Smtp-Source: ABdhPJxSqA52Fe6Scv+ZO/uwRRwJ9a96DKm+yqa4BtEy57fNOznzRlh0j/lpoudMnaQzxMRVmizDPY1PIdZChZZYoL0=
X-Received: by 2002:a67:a60c:: with SMTP id p12mr102037705vse.25.1636376086064;
 Mon, 08 Nov 2021 04:54:46 -0800 (PST)
MIME-Version: 1.0
From:   Shantur Rathore <i@shantur.com>
Date:   Mon, 8 Nov 2021 12:54:37 +0000
Message-ID: <CABEcMwWwsa1Q_mZaf=QUQb-Gc-xe=gmL6F2v3BPGyrJ7-mfB2g@mail.gmail.com>
Subject: usb-gadget: dynamic reconfiguration
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I am trying to figure out if it's possible to reconfigure a usb-gadget
when it's live.
The idea is to create a gadget with 1 function - lets say a serial gadget.

Upon communication with the host, the host could specify (via Serial
communication) which is the next gadget it needs for example a mass
storage or ecm and the next gadget can be added to the configuration.

For now this only works if the gadget is disconnected and reconnected
to the UDC.

I want to understand if it is technically possible to add more
functions to a live config without affecting existing functions.

Kind regards,
Shantur
