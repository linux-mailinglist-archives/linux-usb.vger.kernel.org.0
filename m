Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968D36337D0
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 10:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbiKVJCl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 04:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbiKVJCe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 04:02:34 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4825239E
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 01:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669107752; x=1700643752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9lYdUS0fcH0AFppWnWjU+TBzBUS1lFO4GIGgF2G6wWU=;
  b=bYqOGed6dHMwxvFQ+0uNer2XfDsOlsF+uloLx+wEe50N8ObEO5k/5E8V
   74BUdXOc4rN952o4yfF8S/omQk7CgZZAj5+NVdtsgfCz9u64T3Rz7wJiT
   5eGf/ELnp0TzSZwcoCMSBK5sS0FFjAkTaz0AAqWRLCvMcOoTwsuvLByfo
   bXO9Q6SL9War+MPKe1MLnXo8VnVCvQe4mP4q5JhNwAV0p2776bSuXO2/i
   tTsuOXEEKKaVY/ppPiQ01U9TBWBD0EKKWZO/owD4tCldC3IxEqB0mfZcR
   kKchrVG785ZEaDbr0Q6oB4h0gdXC9LD3WWm6tv8hK6aOebkhb0O+dX13h
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="297125817"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="297125817"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 01:02:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="783775399"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="783775399"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 22 Nov 2022 01:02:20 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 22 Nov 2022 11:02:19 +0200
Date:   Tue, 22 Nov 2022 11:02:19 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     gregkh@linuxfoundation.org, chunfeng.yun@mediatek.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Message-ID: <Y3yQG+vwB7p9Msul@kuha.fi.intel.com>
References: <20221121144620.4059019-1-yangyingliang@huawei.com>
 <Y3yJYXBKgwD1fmCg@kuha.fi.intel.com>
 <3dca37e7-a8d7-eaaa-384b-c70d88aee934@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dca37e7-a8d7-eaaa-384b-c70d88aee934@huawei.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 22, 2022 at 04:47:00PM +0800, Yang Yingliang wrote:
> 
> On 2022/11/22 16:33, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Mon, Nov 21, 2022 at 10:46:20PM +0800, Yang Yingliang wrote:
> > > I got the following report while doing device(mt6370-tcpc) load
> > > test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:
> > > 
> > >    OF: ERROR: memory leak, expected refcount 1 instead of 2,
> > >    of_node_get()/of_node_put() unbalanced - destroy cset entry:
> > >    attach overlay node /i2c/pmic@34
> > > 
> > > The 'parent' returned by fwnode_get_parent() with refcount incremented.
> > > it needs be put after using.
> > > 
> > > Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
> > > Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > That's not the appropriate tag in this case. I have not suggested
> > this patch.
> > 
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > > v2 -> v3:
> > >    Remove not needed null pointer check.
> > > 
> > > v1 -> v2:
> > >    Add description to how is the report generated.
> > > ---
> > >   drivers/usb/roles/class.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > > index dfaed7eee94f..0650295f261c 100644
> > > --- a/drivers/usb/roles/class.c
> > > +++ b/drivers/usb/roles/class.c
> > > @@ -106,10 +106,13 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
> > >   	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
> > >   	struct device *dev;
> > > -	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
> > > +	if (!parent || !fwnode_property_present(parent, "usb-role-switch")) {
> > Please change that as well like I proposed earlier:
> > 
> > 	if (!fwnode_property_present(parent, "usb-role-switch")) {
> > 
> > You don't need to check the parent separately.
> Yes, fwnode_property_present() has already checked the parent, the parent
> check can be removed.
> Need I add your suggest tag when I send v4 to change it as above.

No. I still have not suggested this patch. I've only commented it.

thanks,

-- 
heikki
