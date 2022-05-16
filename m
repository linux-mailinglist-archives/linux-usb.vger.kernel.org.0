Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292AE5280EB
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 11:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238686AbiEPJge (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 05:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbiEPJg3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 05:36:29 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07ACDFD8
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652693787; x=1684229787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4+AGnvVeFLASkiYe82ZG3Srr6ecqid1JV41V+YcslvQ=;
  b=YNeBvf1y0X+1hbfHkvYWKRNhCV3bqzRaITFn8wFd2GnWRmD1EqaFY824
   IFn0C0FrUjHImzDNwdqtBKT1ItoXIjTcP9s9hnqCXERAOTTGWLN5qcKgl
   7FIfP9EKpb+OhHxAf8AlefsNb8QyvMZ7IRR+gcNVn51VFVobabYugBpwn
   bv8SSdA18FNOLmNeWYFUzkMefy8afB0JOi5M4bEzCZDy5ng81wmTVugmB
   yTOs0eC1vsH7W8oxK/Uc8T/YOJtVrd9l/Xma5LpN9GgjsHd/V4V5BMMSp
   lo9mtR7a65Dt2W6M2R2VRFq4jv0WxeTTXIqDkGnliqOWjAV4XVcfzUvAO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="258352286"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="258352286"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 02:36:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="522376845"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 02:36:19 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 16 May 2022 12:34:06 +0300
Date:   Mon, 16 May 2022 12:34:06 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi
 uni-directional once DisplayPort tunneled
Message-ID: <YoIajuneoVCCcfGZ@lahna>
References: <20220511140549.10571-1-gil.fine@intel.com>
 <20220511140549.10571-7-gil.fine@intel.com>
 <Yn4qld89AVEd3cRD@lahna>
 <20220515202746.GA8368@ccdjLinux26>
 <YoIMh0Di7QtALQ/Z@lahna>
 <20220516085903.GC8368@ccdjLinux26>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516085903.GC8368@ccdjLinux26>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 16, 2022 at 11:59:03AM +0300, Gil Fine wrote:
> Hi Mika,
> 
> On Mon, May 16, 2022 at 11:34:15AM +0300, Mika Westerberg wrote:
> > Hi Gil,
> > 
> > On Sun, May 15, 2022 at 11:27:46PM +0300, Gil Fine wrote:
> > > > > +int tb_switch_tmu_config_enable(struct device *dev, void *data)
> > > > 
> > > > Also can we please make it take some real type and not something
> > > > arbitrary?
> > > You mean the names, right?
> > > Something like:
> > > int tb_switch_tmu_config_enable(struct device *parent, void *rate)
> > > If so, yes, I will
> > 
> > I mean use a real type, not void *.
> > 
> > > > 
> > > > Can it be const too?
> > > IIUC, it shall be a function pointer with specified signature otherwise it will fail
> > > at compilation
> > 
> > Okay then I suggest to make a reasonable "API" function that handles
> > all this internally that does not take arbitrary pointers. Remember to
> > document it in kernel-doc too.
> 
> This is a function pointer that shall be passed to device_for_each_child()
> And it has to be defined as:
> 
> int (*fn)(struct device *dev, void *data)
> 
> Similar as here e.g.:
> 
> static int remove_retimer(struct device *dev, void *data)
> {
> »·······struct tb_retimer *rt = tb_to_retimer(dev);
> »·······struct tb_port *port = data;
> 
> »·······if (rt && rt->port == port)
> »·······»·······tb_retimer_remove(rt);
> »·······return 0;
> }
> 
> void tb_retimer_remove_all(struct tb_port *port)
> {
> »·······struct usb4_port *usb4;
> 
> »·······usb4 = port->usb4;
> »·······if (usb4)
> »·······»·······device_for_each_child_reverse(&usb4->dev, port,
> »·······»·······»·······»·······»·······      remove_retimer);
> }
> 
> So not sure I get you...

The difference is that above it is static function not exposed outside
of that file and used directly below its implementation.

In your case you make it non-static "API" function exported from tmu.c
and called from tb.c.

So instead I suggest to put the device_for_each_child() in tmu.c and
then the tb_switch_tmu_config_enable() static right above it. Please
also name the resulting API function consistently.
