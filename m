Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D398589952
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 10:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239472AbiHDIbh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 04:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiHDIbe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 04:31:34 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAB35E33C
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 01:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659601893; x=1691137893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y4tx9sw80oOERp/x3aiH2GRtXf+yGnFeZVUfruvLIZE=;
  b=HOAz0E6SXezMYTOdWjYUqw65hetItY8qyDRspiY0WtWZGzTQpg/I01T8
   DAldbUUsTWVOGT/Pgzowe3K9YSFSYy3w5mi5stwXWmnAEIR/N2uXAAUBo
   eAAmgDWehynnm6S+ImoY0v/AJU1QmP1C6iVekId/OmKQXtC8YQ0XTX+Ck
   JPYtqdgMyImE/NZy0sFypb9zlC8ocRizOZLKH/5PP+2K7Rk7ZWibDfYyF
   pu5DXgUlvWybI3UhXJ+zPy46d6CQ9/kcSHFwbY7JtgbIDdklRZkwv0Db4
   H1bNQnC862JuV3+d7xcWpaId6Js6lWacqqaLSP9Efcti0/Uf+B+R4kokw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="315748955"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="315748955"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 01:31:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="662440718"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 01:31:07 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Aug 2022 11:31:01 +0300
Date:   Thu, 4 Aug 2022 11:31:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Message-ID: <YuuDxU59ud2LhFbl@lahna>
References: <1659587394-115256-1-git-send-email-Sanju.Mehta@amd.com>
 <Yutnjq64OO07QbAR@lahna>
 <a5b6e0a1-a334-1bc5-46fa-b9ee5f53688f@amd.com>
 <YutwWI8xENDkAtg9@lahna>
 <5ba4e184-d9cb-a120-8044-e200b6e47812@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ba4e184-d9cb-a120-8044-e200b6e47812@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 04, 2022 at 01:39:44PM +0530, Sanjay R Mehta wrote:
> 
> 
> On 8/4/2022 12:38 PM, Mika Westerberg wrote:
> > On Thu, Aug 04, 2022 at 12:34:09PM +0530, Sanjay R Mehta wrote:
> >>>>  			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
> >>>
> >>> Here tunnel can be NULL...
> >>>
> >>>> +			tb_dp_resource_available_discovered(tb, tunnel->dst_port);
> >>>
> >>> ... so this will crash and burn.
> >>
> >> Thanks. Agree, I will add check here and resend the patch.
> > 
> > Please don't add the check here but move this to tb_start() as I
> > suggested.
> 
> Sure Mika.
> 
> As you earlier suggested to move this function to either "tb_start() or
> tb_discover_tunnels()".
> 
> 
> Since adding of this DP OUT resource is required for each DP tunnel,
> hence I felt it will be better if I move this function in
> tb_discover_tunnels() where we can avoid extra for loop for tunnel.
> 
> Below is the place how I am thinking of adding
> "tb_discover_dp_resources()" function.
> 
> 
> static void tb_discover_tunnels(struct tb *tb)
> {
>         struct tb_cm *tcm = tb_priv(tb);
>         struct tb_tunnel *tunnel;
> 
>         tb_switch_discover_tunnels(tb->root_switch, &tcm->tunnel_list,
> true);
> 
>         list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
>                 if (tb_tunnel_is_pci(tunnel)) {
>                         struct tb_switch *parent = tunnel->dst_port->sw;
> 
>                         while (parent != tunnel->src_port->sw) {
>                                 parent->boot = true;
>                                 parent = tb_switch_parent(parent);
>                         }
>                 } else if (tb_tunnel_is_dp(tunnel)) {
>                         /* Keep the domain from powering down */
>                         tb_discover_dp_resources(tb, tunnel->dst_port);
>                         pm_runtime_get_sync(&tunnel->src_port->sw->dev);
>                         pm_runtime_get_sync(&tunnel->dst_port->sw->dev);
>                 }
>         }
> }
> 
> 
> Does this make sense? Please suggest me if I have to do it other way.
> Appreciate your help.

How about splitting this into tb_discover_dp_resources() that then calls
tb_discover_dp_resource() for a single router? Whatever is the simplest ;-)
