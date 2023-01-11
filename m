Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E79665946
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 11:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbjAKKpS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Jan 2023 05:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238543AbjAKKpA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Jan 2023 05:45:00 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9A32BEC
        for <linux-usb@vger.kernel.org>; Wed, 11 Jan 2023 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673433899; x=1704969899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oCcQ9+pTTJkbma3VCvI5u+UP4rBHnsRHoEty2oZiceY=;
  b=l/LDWqvn8HqitnXjEabiyLqLlwIU0QJZSzylVNLxroXQiip6VMpgdOLC
   FnEWoRKd0BBJDZ3qav5XXL7rZu3ApAZSus8xB3yaOXzI64OxDSk/4z/vs
   r0BPMRoGeCgb1jFFbLx2cNgEjb6JUKzUr/28jgIz3s3xcPl3tlNRRaF3y
   qkxSbfPMTKhkl/lVnn1yfN3MYcjODBC5p7xOyukSFLTrIjqqpIGNspJkR
   XOrXmQXpeK+qowgmVLbyycUrGx/drfjNODPB4uFn1NARaBc/txsqAQu6+
   9BR7YwLHkjpaRD4aQvpPE+MasJgufi5GjxwHc6jNikvFvYdSPPrV+YEw5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323448362"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="323448362"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 02:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="720686293"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="720686293"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jan 2023 02:44:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D9AB9E1; Wed, 11 Jan 2023 12:45:31 +0200 (EET)
Date:   Wed, 11 Jan 2023 12:45:31 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y76TS54PJpmseZs3@black.fi.intel.com>
References: <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 11, 2023 at 11:38:02AM +0100, Christian Schaubschläger wrote:
> Hi,
> > Okay thanks for checking. I'm discussing with our Windows folks if there
> > is something done differently in Windows side. They do similar reset in
> > certain flows but I'm not sure if it is exactly on "reboot" and it is
> > not clear whether Windows and Linux "reboot" in general is doing the
> > same thing either.
> >
> > In the meantime, did we try this already?
> >
> > 0. Drop all kernel changes
> > 1. Boot the system up, nothing connected
> > 2. Plug in the dock
> > 3. Check that it works (lspci etc.)
> > 4. Unload the Thunderbolt driver
> >
> >   # rmmod thunderbolt
> >
> > 5. Reboot the system
> 
> I think we did not try this one so far. But I did now -> same result...

Okay :(

> What I _did_ find out is this: if I disable ACPI on the kernel command
> line (acpi=off), things work fine. I can even boot with the dock
> unplugged, then plug it when linux is up, and it works in linux, and
> also after the reboot in the firmware!
> 
> Of course switching off ACPI is not a real option... but maybe this
> brings some light into the dark...

It pretty much disables a lot of functionality so I don't think it helps
here, unfortunately.
