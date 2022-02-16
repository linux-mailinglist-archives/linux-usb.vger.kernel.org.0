Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9F84B85E3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 11:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiBPKfS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 05:35:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiBPKfR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 05:35:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF0A2B9A22
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 02:35:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1404B81E64
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 10:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57A2C004E1;
        Wed, 16 Feb 2022 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645007702;
        bh=S1rdJHVle2fov/IGSQLik4KoFuLV7FHeCgn8jIK/S+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xhVNKCI0m2MjBCZOaDOql+YvjlSf8tR5V2BI75vOt/mkDQzyCrrQoOLHt/bgsxa7q
         5vnClLU/yX+puI9ciy6AvZVwTnVTLfRc7nmTPylCitJJezdvjhQox+7nKrdenxs5Rd
         2B8M4FcWRCwEThTzpNXmgTMxuVuRN3aWvlAKI0Mg=
Date:   Wed, 16 Feb 2022 11:34:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: Re: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
Message-ID: <YgzTU/zkWeAy6wM8@kroah.com>
References: <1644994755-12975-1-git-send-email-quic_linyyuan@quicinc.com>
 <1644994755-12975-2-git-send-email-quic_linyyuan@quicinc.com>
 <4688f5bb-c0fd-bbce-de1f-a554d543ed03@gmail.com>
 <DM8PR02MB819861F71713D5539EF66D12E3359@DM8PR02MB8198.namprd02.prod.outlook.com>
 <c6cf661b-b3df-281f-3cb0-8899c95f9ce2@gmail.com>
 <DM8PR02MB819806B3CE8EB69B516E893AE3359@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB819806B3CE8EB69B516E893AE3359@DM8PR02MB8198.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 16, 2022 at 09:57:04AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
> > Sent: Wednesday, February 16, 2022 5:53 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>; Mathias Nyman
> > <mathias.nyman@intel.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>
> > Cc: linux-usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> > Subject: Re: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
> > 
> > On 2/16/22 12:47 PM, Linyu Yuan (QUIC) wrote:
> > 
> > > that's correct,  from my view, one line is good,
> > >
> > > What's your suggestion ? two lines ?
> > 
> >    Yes, and it is not just my suggestion -- it's the kernel coding style.
> I think in linux, there are many code like this,
> 
> arch/m68k/sun3x/dvma.c:         if((pmd = pmd_alloc(&init_mm, pud, vaddr)) == NULL) {
> ...

That file pre-dates the use of the kernel coding style.  Please look at
modern code (i.e. written in the last 15 years.)

thanks,

greg k-h
