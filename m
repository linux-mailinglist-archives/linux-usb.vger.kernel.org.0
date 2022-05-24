Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1430053287B
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 13:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236484AbiEXLEO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 07:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbiEXLEH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 07:04:07 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FF28DDC8
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653390246; x=1684926246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8KjEU11ZmTKXvx3YSoM8Zsew3OTmXhw8zgGrfWDS6A4=;
  b=ANvXTnQo3UjhsvmHjUCJbawASsgTpoedK6a2M4WzYZYPoznn4djCYChf
   WyzoP+NVJUpP45b83zjOGoS1UtlFwWLLiYu+VqRcoRIWWKxOnR0O6XyRX
   fQxwOjW73HFdZbKMLvC3Z7CCtVwp34CkHdCAp9huNipOJs4fLjq/fTp4Y
   4qVBgVL5nJiZhdQDQIBihkaRiFoxrsIjUBnADf2oh97y9bLcFh/fSAK6f
   DLIa+ci2WIdoTgfoV4XsJS5CKvb/YKI00z+gdK94TJDarvwfvIQELMOUs
   YuNeuFKPDbsoLc7PgMLhLd9D9UkJXNMzlLy4+rK9ebPr8H2x5tvJ5rj1Z
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273611212"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="273611212"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 04:04:05 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="641896486"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 04:04:03 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 24 May 2022 14:04:01 +0300
Date:   Tue, 24 May 2022 14:04:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: Thunderbolt: One missing DisplayPort?
Message-ID: <Yoy7oXpMugFFmfBP@lahna>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, May 24, 2022 at 01:55:23PM +0300, Heikki Krogerus wrote:
> +Mika
> 
> On Fri, May 20, 2022 at 12:22:50PM +0200, Stefan Hoffmeister wrote:
> > I am trying to diagnose a problem where I get video output on
> > Thunderbolt on one DisplayPort, but no output on the second
> > DisplayPort.
> > 
> > I would love to turn on all the (kernel-level) logging output that
> > there is, but do not know how to do that.
> > 
> > Basically, on a Dell Inspiron 16 Plus (7610) laptop with Thunderbolt
> > 4, I am running Fedora Linux 36 with kernel 5.17+.
> > 
> > Connecting that laptop to a Thunderbolt docking station (Intel
> > Thunderbolt 3 chip inside),
> > with two screens attached via DisplayPort, I get only one screen up and running.
> > 
> > I'd like to discover more about this apparent error mode, because
> > attaching a different TB3
> > setup works fine. I am looking for some means to enable logging or to
> > get debugging insight.
> > 
> > Generally speaking, I suspect that this specific Dell laptop
> > (configuration) has some challenges
> > in the BIOS, and with Thunderbolt in general, but am totally blind to
> > what is going on.
> > 
> > This system offers potential for fun, this being a hybrid PRIME
> > configuration, with an Intel iGPU passing through to an Nvidia dGPU
> > which seems to be the only wired-up way to get DisplayPort output.

In that system all the tunneling is done by the firmware so there is
really not much you can debug on the kernel side. You can add
"thunderbolt.dyndbg" in the command line to get more verbose logging but
I doubt it reveals anything useful.

How do you connect the monitors to the dock and what dock it is?
