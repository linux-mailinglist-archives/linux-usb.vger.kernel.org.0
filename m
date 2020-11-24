Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBEA82C31C3
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 21:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbgKXUNl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 15:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730367AbgKXUNk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 15:13:40 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DE9C0613D6
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 12:13:40 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id p12so17056643qtp.7
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WjrwSOgmK7tVwq8WvjS7LthFjsI+tsu+eyf3qqK2kfM=;
        b=ceTg5YmP47arROPC2Liz0mYMSHnqW9GuA7oK8Rrd2PPEJ6Ygre/fslMEfKH3xZsJZf
         ykvg8b30xjvim60a6CElFs8iOw4ZI//fFlxOOqxblxur0TFoMDOTb0Go45xUss3spoIB
         h9rtxVpDXmitlMiPFuUZXO8jJ07wAyt4EU4WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WjrwSOgmK7tVwq8WvjS7LthFjsI+tsu+eyf3qqK2kfM=;
        b=i5qJ/rIV10ly6GNSUJ3GG8G5nljO26lIk661r5/6Srce+sZDy2CZh9NcHHc4WDOftK
         j3mHAN45tR/CStIW2ub/k+eEzUmtWapN5FbbFbAlzpCwIQ9K1G5hSICctloFLeYbVODv
         IrDarMgrI8BuOSSad/Ik33Uufbi2wfgP+yq40bFzoUOoYPE8V4s8Lz33oPKBcfUaYSrw
         z19Qg9PgeNGwKBpqoKRop1vGPEbVlkPAinkxQw6nYwYBtHiz14pLKhIC7pr4qSUHbxsm
         QTOpaT7q+zqf8yTPaC5Wdma8lzleKL11s989ARb++pfYL7PqLqo3Emcby6lNXckE/dfu
         O7ng==
X-Gm-Message-State: AOAM532j26h5cmKs+biR3TK9592gYZHVjlFX3QJuAvEcadF7y/M14kNG
        y/rNuhDXgXGdtMWFXiiGXsi4GPsrlE+HPBDfsydu0Q==
X-Google-Smtp-Source: ABdhPJyXA5fvd1TsMQp2qugJ5lv7k71ebl0ixrjc/JxV/SYTBZkFvEQGWkEXlTiBSFyS83C0bxAjnlW04S92/pKDkQY=
X-Received: by 2002:ac8:7345:: with SMTP id q5mr6306085qtp.297.1606248819400;
 Tue, 24 Nov 2020 12:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20201023214328.1262883-1-pmalani@chromium.org> <20201124132301.GC1008337@kuha.fi.intel.com>
In-Reply-To: <20201124132301.GC1008337@kuha.fi.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 24 Nov 2020 12:13:28 -0800
Message-ID: <CACeCKackFrrtvkxma0acBP-mv_f7nGKtOuknCmy_YHynS38+Bg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] usb: typec: Consolidate syfs ABI documentation
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Tue, Nov 24, 2020 at 5:23 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Fri, Oct 23, 2020 at 02:43:26PM -0700, Prashant Malani wrote:
> > Both partner and cable have identity VDOs. These are listed separately
> > in the Documentation/ABI/testing/sysfs-class-typec. Factor these out
> > into a common location to avoid the duplication.
>
> This does not apply any more. Cany you resend these.
Thanks for the heads up. Resent here [1]

[1]: https://lore.kernel.org/linux-usb/20201124201033.592576-2-pmalani@chromium.org/

BR,

-Prashant
