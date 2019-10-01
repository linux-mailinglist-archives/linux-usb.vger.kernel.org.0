Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39047C3A67
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 18:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfJAQXQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 12:23:16 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:33464 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727339AbfJAQXQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 12:23:16 -0400
Received: by mail-wm1-f53.google.com with SMTP id r17so2918722wme.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 09:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HfqrpqLs76Pt0f27qnd57A/KNk1+64U/XiwmLVi0Y4E=;
        b=su+GUl7wuzyW8bDNCvxM9N9574jVgvGhMPz/1tQd//MeHb4hXr5+APu3AFWOn/vyHk
         G1Y51RhoQTM8qKzydBTi5Y0klEm3naL7vv/gU7Owfb0vru7E2D6Lib4m5Gt9JBEksE/5
         6ojhZsjyw1Xj8wjOKy37TgzjUwyR+R97CCFxX/V/Xmk/fZRqRDCr60p5ZlHNew5AoFQg
         zM7C7l1pkgFOX+Nvk5woX9tqHCfIMLMSwMe+YuDEVKGcnSBcVhgCzx1L4eAjy4+9+w/m
         5hfzGJrKXapxqYzbxkAdzMEAaJmHxQUfyZVVrKicTXUNzxjAtTcbVGoWXPSWBSJpyEme
         5iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HfqrpqLs76Pt0f27qnd57A/KNk1+64U/XiwmLVi0Y4E=;
        b=c5gCH9Pdi5fHSjI+3uo32GJKiTnqHVWjdlIARvtSEMtnxwcNlQGO5FErEGLKyd1aiJ
         bxTUCsUBKfhSc+FtRFA6CJisWquL899sCiGAeczih8KSCbY3RzytQpV2ZoKdWnAAx+9w
         W8Z/aL9jYC2eZXMR41xOEFcxtV6KTYMbQadOIvosYbGWivzJjjpOf5Qx21bG8urHuJ9m
         QtG9XD3FRj5Ihw6O4frytY8S06zzzYGTi4bV4hWMZCrADun6ZN8mv14b9pVBA2pRG9au
         +QACL/8beOoNQdR3h7ra3ggFbwom2Ni4RTyXUH5CeFURUI5iN9rsv3HYRLCyQVS5sNyq
         MDkA==
X-Gm-Message-State: APjAAAWReBno7wi+DZB6rfVcyOM0JqXKHjUim5CpjqjPZ6OweqE2OQCE
        l0szY/jJzyaKRpT2PviqXMaffvR46B5S7w==
X-Google-Smtp-Source: APXvYqx8f68bxBLUvG1Y4n8bF7mxJ04+26codcJeMm9LGgTpuXROwNUM+ttDbyMGn7O5oygdv18Qfg==
X-Received: by 2002:a1c:7c10:: with SMTP id x16mr4291450wmc.175.1569946994212;
        Tue, 01 Oct 2019 09:23:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id u10sm32471705wrg.55.2019.10.01.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 09:23:13 -0700 (PDT)
Date:   Tue, 1 Oct 2019 17:23:10 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: depmod warning: unknown symbol usb_stor_sense_invalidCDB in
 5.4-rc1
Message-ID: <20191001162310.GJ90796@google.com>
References: <f78f3025-a50c-5111-b022-12fea1375795@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f78f3025-a50c-5111-b022-12fea1375795@i2se.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 30, 2019 at 10:45:25PM +0200, Stefan Wahren wrote:
>Hi,
>
>during make modules_install for arm/multi_v7_defconfig on current Linux
>5.4-rc1, i'm getting the following warnings:
>
>depmod: WARNING:
>/media/stefan/rootfs//lib/modules/5.4.0-rc1-00006-g4a80125-dirty/kernel/drivers/usb/storage/uas.ko
>needs unknown symbol usb_stor_sense_invalidCDB
>depmod: WARNING:
>/media/stefan/rootfs//lib/modules/5.4.0-rc1-00006-g4a80125-dirty/kernel/drivers/usb/storage/uas.ko
>needs unknown symbol usb_stor_adjust_quirks
>
>Reverting 32bca2df7da2 ("usb-storage: export symbols in USB_STORAGE
>namespace") makes the problem go away.
>
>Would be if someone can take care of it.

Hi Stefan!

Thanks for reporting this. I will take care of it!

Cheers,
Matthias
