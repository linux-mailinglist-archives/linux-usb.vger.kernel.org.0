Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3978F545048
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 17:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241723AbiFIPKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 11:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbiFIPKl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 11:10:41 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D95425C6
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 08:10:40 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id i1so20465870plg.7
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5VT2futDVhu4E/sa0g3JDic7/VGpUjrjykyzU3l/TBc=;
        b=ZqWoVIg8dshjfam3rtC7MpAhtZbjJ2n5RcEdwivWcCDxMOTCo4hKSfWJrnOXlUGONE
         hILH5oTys0B/4XEqdUj/7X1Stwkyv8Crpbl/Ly6ZhnzErVWB988G2KTkK7nUdMB92mo8
         g5fDXPqACmXbGwQIdCAWUZq5uy4G6+JD0nOAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5VT2futDVhu4E/sa0g3JDic7/VGpUjrjykyzU3l/TBc=;
        b=wsHNYK72L13bJExLiyk7jXSfLtCP7PLl0AHSkIdaKGi/8dGkeWe6DZcQUMdkzHDWSL
         SiM8w0yDpnjI710+xEZz2no4J4V/kHSETYJTaxBZUejMUOe76aV4u9pOvPhVb0TlJ41v
         FoWme3i4j21e7AME/2uGU9Zwe738bNBELmUBCPjBxSsuTzb/Vm9ABTRp67RwNrk784E5
         llx7CRdSKIwaxhUus14cGmvLazrLQYemQaGSinDLETCabxuRc/LMbDvc90X5QtdWo6Os
         emkpjdyIxjeEq6im7XS8879EaL61yFRydJqSKrle68+s4uC9c5Ri2zjQodnYIpN/iEru
         Ue1Q==
X-Gm-Message-State: AOAM532g9C5HWtJcZFFCuB7Yc42VBHXVN+viHYj9TK570KlvIq9ZSgJ1
        oCmxUU4LhLqfL6NhV101t1hybQo1u+i5kQ==
X-Google-Smtp-Source: ABdhPJz+toNg3XCJpMrffUYMOVPhHHDrKXeB2K+KzyaYjyMELW4/SVsdHzcMh6L8QgJPTkU/3Syu7A==
X-Received: by 2002:a17:902:e5ca:b0:167:4e08:a63a with SMTP id u10-20020a170902e5ca00b001674e08a63amr32207277plf.69.1654787439919;
        Thu, 09 Jun 2022 08:10:39 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:c543:2c9:1206:951b])
        by smtp.gmail.com with UTF8SMTPSA id iy9-20020a170903130900b0015e8d4eb243sm13589578plb.141.2022.06.09.08.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 08:10:39 -0700 (PDT)
Date:   Thu, 9 Jun 2022 08:10:38 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
Subject: Re: [PATCH v2 4/5] usb: host: xhci-plat: prepare operation w/o
 shared hcd
Message-ID: <YqINbqlrwICtVGfD@google.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
 <506113fe-5bd9-bdd0-7858-2b702ca32d53@gmail.com>
 <YqEMzQgqG16gwFUq@google.com>
 <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 09, 2022 at 02:38:45PM +0300, Mathias Nyman wrote:
> On 8.6.2022 23.55, Matthias Kaehlcke wrote:
> > Hi,
> > 
> > with v5.19-rc1 (which includes this patch) I encounter a NULL pointer
> > exception during system resume on a SC7280 board, which has an
> > USB2-only HCD:
> > 
> ...
> > 
> > In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
> > however this field isn't initialized by __usb_create_hcd() for a HCD
> > without secondary controller.
> 
> Thanks for debugging this, I'll write a patch for it.
> Can you try it out?

Sure!
