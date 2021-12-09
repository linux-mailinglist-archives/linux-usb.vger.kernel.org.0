Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC7746E5B1
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 10:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhLIJn2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 04:43:28 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51146
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229482AbhLIJn2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 04:43:28 -0500
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 74CC03F31E
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 09:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639042794;
        bh=RF8mjWX2rbMrzqrrTOjauOGLhmt2KQwefuBfLZrxSTY=;
        h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
        b=Mg29YuDIpU++0NK/DBasscUzI9TK/JhppUwSbppL+FfdGFWWFD0jYfFB8UrqHBCZ6
         EN2T4NOG2DRZKUBAtd7eqovd5djzXekmMQRKzBF9qtvv879t3ny7v9hl7C/0JD8QNx
         6GiBXcQt7e0qkYgo9IOrIpTwMVQkRYFdUxzGu1qM4hqn+UjSbWs5ss5QI37X8YTEBc
         348Gvh4J9SkACXwXjvAjfjrS6YozyDu8zZLCRUebM4LOp1QfpziT9UzPC6KNJQVx7x
         yl36GareBTcfzd0G0hTBKmWuq6Npx+ZMlfVL5qfOH/3Ig/EQb868GQ5t68jaCN9IS4
         D+20ZhPToCb2w==
Received: by mail-ot1-f72.google.com with SMTP id m23-20020a05683023b700b0055c8a2dcca0so1838072ots.6
        for <linux-usb@vger.kernel.org>; Thu, 09 Dec 2021 01:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=RF8mjWX2rbMrzqrrTOjauOGLhmt2KQwefuBfLZrxSTY=;
        b=2ZFY5gJPXJXK3MgYZjlmSCp74LXpqfb/sZGzikW9pyRoxP3MUE4ptBsskCxhzOpsAy
         8yRQpwPkscilT2uNfzT26uB7j6RTV+8Q2YcDYAB2M7LgfPo6CULq/IYJKSl2DXI7CKc7
         gd0xAZ/y2n9ocGYXLeHfTn/aCOCGSkaT1wUhxkDBw33vx6dRk30Yu9S6tC7nbnLrP7Rf
         AAM9fECibFh5YA3TiCXp7JCuCY+48mCsAnbY4sqJ2i/Dvs+x+GBVBSZN1UeoXybqflNM
         y3g7oFccOcgIQAi/Bg6uHOXUA6F+Ji6b0MfAVF8PN9f8gu5dduH5XTeSQIvDpSZ9dwyD
         4Wnw==
X-Gm-Message-State: AOAM533x6jELYsvtxEC9+gU6ryPfgNZFe7HNquK38saMFkSnT6I+46hJ
        P2ZbmK8Jzd+mDkGNYSt/cwMDG5JvwfMW3o4rMRXpkkCSjNDmK45WwCW/DLI3Sbff45qkA9SBNMR
        MxIir3D5oQQwIuDZQQvRxnzzg+uYrbELZg2FDJg/YKkFAdt5y/kwtmg==
X-Received: by 2002:a4a:d54d:: with SMTP id q13mr3110711oos.57.1639042793026;
        Thu, 09 Dec 2021 01:39:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzijRWv9msOal5mU5JmujRGhjr+O8G3yZfQSeAeBzKE7+kFndNM9oPGFr5MLlOYMHsnquDx3ekJWkcRMcIEaoI=
X-Received: by 2002:a4a:d54d:: with SMTP id q13mr3110689oos.57.1639042792602;
 Thu, 09 Dec 2021 01:39:52 -0800 (PST)
MIME-Version: 1.0
From:   Chris Chiu <chris.chiu@canonical.com>
Date:   Thu, 9 Dec 2021 17:39:41 +0800
Message-ID: <CABTNMG0zcoCqVue8-3cJQ+iTPkJAgjxEN4FB6_ASX2rgXbWunw@mail.gmail.com>
Subject: Discrete Thunderbold Controller 8086:1137 throws DMAR and thunderbolt
 fails to work
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
    We created a ticket
https://bugzilla.kernel.org/show_bug.cgi?id=215265 that is pretty
similar to https://bugzilla.kernel.org/show_bug.cgi?id=214259. So I
tried the patch on https://lkml.org/lkml/2020/6/17/751 but it doesn't
fix the issue. I also tried to boot with the kernel parameter
`pci=nocrs` but it changed nothing either. I attached the kernel log
with thunderbolt dynamic debug on and lspci output on the ticket. Also
tried to disable the intel_iommu, the DMAR failure seems to go away
but thunderbolt still fails to work. Can anyone suggest what kind of
information is required to help identify the cause of the problem?
Thanks

Chris
