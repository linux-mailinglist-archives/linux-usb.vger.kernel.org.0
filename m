Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150122F2584
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 02:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbhALB2S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 20:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729662AbhALB2I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 20:28:08 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD96C061575
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 17:27:28 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id g15so334338pgu.9
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 17:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fj+pFikkVbN3kKSGBOhJQUqNULkL7RGi2LyT5fZ/JMA=;
        b=CdDHmPJauHNZc7iM1yQL3itE8p257XgLEjb7YDboBFPjta2ICrGX7Tz4Wwiw9y/cyW
         uV7sCLHLSn/NaWZgWQurt0lPp77O8+hNsV5fYBn6KNfyUjxT1Li1Rb12tLbYObnQHMGB
         AqIllAqO6HsfuItiSXlCz1cIlYWZy6WieFd9MkIMRqphJutKewTJMyvaY+yvW2o4FqFn
         Y+R9m4Ftz4MOC/xSwKTFsMJxdljBXpVQaWetvj0PN4YLP4GjhaAvSbLLeQSemidOPHBL
         hojq4QcbUqCN67vR46gOtL8t+Zg/0QHT4OOhVqAvkASZxB3n0wJeGy5HWjrKz5HdkroU
         +YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fj+pFikkVbN3kKSGBOhJQUqNULkL7RGi2LyT5fZ/JMA=;
        b=OD3c4kiIbjL1bIh5t9eEkmsbo6I5RUbVk6wpSTrfls4WLNBfh5SbuiahoMGQibWPN6
         UmitAI5pn5GQrool798IZRkD/mCi43FkGLBQoA3vSkdzfYL27WNlbUtFa9h+RNrG33zg
         x/gMLfXNCNWbicE1cwNirHk9MXLHoo1ruymi4IGIhZcOHhrZ4eZFIW9X4ITgVLEoSaOc
         CeGbaV6w+a3k6PlQXMnp+IlpJIR1+eRb2uh9Skh28m7+9JkjkmXpJz+KA2a1PgFxmti5
         SeY+F8pp0Vstc25fGV14YJCwFo0J4fyTA1UHTKB1Yx/QRNsyRyIVk66YAhSjBZcxP2Ou
         IO7Q==
X-Gm-Message-State: AOAM5306/6wKwmYKerq3MowK3LD43+NcXQET51sOclE/Mkvfu38fBZgF
        gN9LFXyHVQ6SafdMVAeOzQU=
X-Google-Smtp-Source: ABdhPJxFG4J4m+hsmzlO2TUwa7GmfgZ5Znag8yNOAzrtoPUJrLg1ixq210Lygcxl30c7GHb67PBgSQ==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr2228762pgl.46.1610414847678;
        Mon, 11 Jan 2021 17:27:27 -0800 (PST)
Received: from b29397-desktop ([84.17.34.154])
        by smtp.gmail.com with ESMTPSA id r79sm873598pfc.166.2021.01.11.17.27.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 17:27:26 -0800 (PST)
Date:   Tue, 12 Jan 2021 09:27:19 +0800
From:   Peter Chen <hzpeterchen@gmail.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: udc: core: Introduce started state
Message-ID: <20210112012719.GA16285@b29397-desktop>
References: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
 <20210111212955.GA1209265@rowland.harvard.edu>
 <1e5bbddf-df52-d293-d27d-9cb034eadce8@synopsys.com>
 <21c4feb3-a74b-3374-d401-438f1e62a477@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21c4feb3-a74b-3374-d401-438f1e62a477@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-01-11 22:35:07, Thinh Nguyen wrote:
> Thinh Nguyen wrote:
> > Hi,
> >
> > Alan Stern wrote:
> >> On Mon, Jan 11, 2021 at 12:38:05PM -0800, Thinh Nguyen wrote:
> >>> For some UDCs, the initialization sequence by udc_start() should not be
> >>> repeated until it is properly cleaned up with udc_stop() and vise versa.
> >>> We may run into some cleanup failure as seen with the DWC3 driver during
> >>> the irq cleanup. This issue can occur when the user triggers
> >>> soft-connect/soft-disconnect from the soft_connect sysfs. To avoid
> >>> adding checks to every UDC driver, at the UDC framework, introduce a
> >>> "started" state to track and prevent the UDC from repeating the
> >>> udc_start() and udc_stop() if it had already started/stopped.
> >>>
> >>> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> >> Is the new "started" field subject to races?  What happens if there are 
> >> concurrent requests to start and stop the UDC?
> >>
> >> Alan Stern
> > The caller of this usb_gadget_udc_start/stop() should take care of the
> > locking. It's already done in the case of driver probe/remove, but not
> > for the sysfs soft_connect. Maybe I should add that to this patch.
> >

The udc_bind_to_driver (calls ->start) and usb_gadget_remove_driver(call
->stop) are protected by mutex udc_lock, so don't have concurrent issue for
it. For soft_connect, I think you could add the same mutex.

-- 

Thanks,
Peter Chen

