Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD97C631C24
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 09:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiKUI4b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 03:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiKUI4H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 03:56:07 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF39B0C
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 00:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669020958; x=1700556958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L7bDrNDPW9R1UprzPDUjVHfkmoffZ1I2plEGmUVXLr4=;
  b=mPYLKp1ClArbxnM19QsjDe2Ng1Y6cYCkHKISt+xUPpj1whq5jpVXQX2t
   Dc4eQoClueR/JKHH1KWwmrInIcuHqGUkOafTH6olJGNl7Op+I40XAhZ5A
   PanClTlhODvdfIeA6l5KuSmGqmPmwcB7MuzxsIyEYLy/PviyydvCV2Npi
   EeGL+1cFVB7eoi3bS0sWS1ZIN4lIvxM5Oc7FUfyDoPVSp5anACuq8p/7b
   T6RQfVsbaA8MqITqdcQrYOVlmmPhmdVpn9wB6fTEHjbYwOOPkko/wdPdu
   RoYc8z2vsi7bknuSWNY8qqFeJDtEtpXj/DwAIvcUIzv9T2QFP0dRErp79
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="313537580"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="313537580"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 00:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783371411"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783371411"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 00:55:56 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 10:55:55 +0200
Date:   Mon, 21 Nov 2022 10:55:55 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= 
        <Chunfeng.Yun@mediatek.com>
Cc:     "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Message-ID: <Y3s9G199bfkZxrJK@kuha.fi.intel.com>
References: <20221119091541.1755640-1-yangyingliang@huawei.com>
 <097dc06a02377bf67e4d67a016060dbcd06f4798.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <097dc06a02377bf67e4d67a016060dbcd06f4798.camel@mediatek.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Nov 21, 2022 at 07:49:31AM +0000, Chunfeng Yun (云春峰) wrote:
> On Sat, 2022-11-19 at 17:15 +0800, Yang Yingliang wrote:
> > I got the following report while doing device(mt6370-tcpc) load
> > test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:
> > 
> >   OF: ERROR: memory leak, expected refcount 1 instead of 2,
> >   of_node_get()/of_node_put() unbalanced - destroy cset entry:
> >   attach overlay node /i2c/pmic@34
> > 
> > The 'parent' returned by fwnode_get_parent() with refcount
> > incremented.
> > it needs be put after using.
> > 
> > Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > ---
> > v1 -> v2:
> >   Add description to how is the report generated.
> > ---
> >  drivers/usb/roles/class.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index dfaed7eee94f..289950e5fcfb 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -106,10 +106,14 @@ usb_role_switch_is_parent(struct fwnode_handle
> > *fwnode)
> >  	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
> >  	struct device *dev;
> >  
> > -	if (!parent || !fwnode_property_present(parent, "usb-role-
> > switch"))
> > +	if (!parent || !fwnode_property_present(parent, "usb-role-
> > switch")) {
> > +		if (parent)
> > +			fwnode_handle_put(parent);
> >  		return NULL;
> > +	}

fwnode API should be NULL safe, so perhaps like this - clean also the
old condition while at it:

        if (!fwnode_property_present(parent, "usb-role-switch")) {
                fwnode_handle_put(parent);
                return NULL;
        }

> >  	dev = class_find_device_by_fwnode(role_class, parent);
> > +	fwnode_handle_put(parent);
> >  	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> >  }
> >  
> + Heikki

Thanks Chunfeng!

cheers,

-- 
heikki
