Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05AB71FBB3
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 10:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbjFBISF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 04:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbjFBISE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 04:18:04 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E2BEB
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685693884; x=1717229884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AhzIP7Xp1OhQ0p8aXV53sBgLJ68c2Oh81CpDP66vHUs=;
  b=COtGSQLpVl6PNrcX3CfmRBOeQ5EmLp6GOIhwDPPLgEawoD8LNFthxNBh
   OOXIDcm6u3EJ8c65EAfawA+CCGQOvwudPTZtVxL4nukrRUaBdVnc8haZR
   /NUAUL/cuZwesbKhvmHA+PElKMJzhZONaxqAXfp06Z6uA3sijrLAcFGyI
   qlIxx5r1ln2k4vRTmOTJHrhG88L3DFu1mpJB+yDXdGcOdYx8WsoZq4cJo
   e6v+HbzRgPqv12LPdACr5CJwDL5A9lBMfrp7CLPChwIMkJl9jb4IYwrqh
   0vG/1azC+3Vx4n++W5Cz0jz44J1/jRj+sFOb6vSt9p3L44n6Ufgiac4F1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419342178"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="419342178"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 01:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772800730"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="772800730"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 01:18:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7467853A; Fri,  2 Jun 2023 11:18:07 +0300 (EEST)
Date:   Fri, 2 Jun 2023 11:18:07 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH 03/20] thunderbolt: Identify USB4 v2 routers
Message-ID: <20230602081807.GN45886@black.fi.intel.com>
References: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
 <20230531090645.5573-4-mika.westerberg@linux.intel.com>
 <CA+CmpXsrqNUdF5Td7Caa4Vr3i9hui+eRULr+_XRuehmkQ95U=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CmpXsrqNUdF5Td7Caa4Vr3i9hui+eRULr+_XRuehmkQ95U=g@mail.gmail.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 31, 2023 at 03:00:22PM +0300, Yehezkel Bernat wrote:
> On Wed, May 31, 2023 at 12:06 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > index 2bda2816ff47..e27fcdf50581 100644
> > --- a/drivers/thunderbolt/tb.h
> > +++ b/drivers/thunderbolt/tb.h
> > @@ -955,7 +955,8 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
> >   */
> >  static inline bool tb_switch_is_usb4(const struct tb_switch *sw)
> >  {
> > -       return sw->config.thunderbolt_version == USB4_VERSION_1_0;
> > +       return FIELD_GET(USB4_VERSION_MAJOR_MASK,
> > +                        sw->config.thunderbolt_version) > 0;
> 
> Does it make sense to reuse the function below i.e. `return
> usb4_switch_version(sw) > 0;`?

Yes, I think it does. I'll change this.
