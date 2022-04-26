Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF93F50FB18
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 12:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346360AbiDZKlQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 06:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350268AbiDZKkU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 06:40:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9908DB6
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 03:30:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 267FCB81D52
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 10:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4067FC385A4;
        Tue, 26 Apr 2022 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650969009;
        bh=CU/HBoNB92rU0rmf7epvx4Utj0M89EKDnvgARZdup2U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i5gMoioC5cSOtGR+PAPOqoSQahcu7r70Hyrl5b8JAmK8G+iu7JkbFXg6XX4wxrEPc
         Kh50ae+xb5znmIzwny4lnCU9JtKafhUqT2hNYw63rYN5BCXD772cUAYfWjmT4a5klp
         gd+lWVLyZ+lfLUZey2RrYYf2ckIrzlAPOngbITwg=
Date:   Tue, 26 Apr 2022 12:30:07 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Message-ID: <YmfJr46kLZ3MtiCU@kroah.com>
References: <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
 <YmbCBwEMvKO5z0Dh@kroah.com>
 <YmdYfK5Vi+lEl7FX@quokka>
 <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com>
 <YmedlsENjNjc8yML@kroah.com>
 <fcb10f35-3064-851b-8f53-e88a3b51c930@suse.com>
 <d49aeb3cd8f67674eb87bf4bc93f617937649bc7.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d49aeb3cd8f67674eb87bf4bc93f617937649bc7.camel@hadess.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 12:07:32PM +0200, Bastien Nocera wrote:
> On Tue, 2022-04-26 at 10:46 +0200, Oliver Neukum wrote:
> > 
> > 
> > On 26.04.22 09:21, Greg Kroah-Hartman wrote:
> > > Yes, but, it's not so simple.  Many people have asked for revoke()
> > > to be
> > > added as a syscall like is in the BSDs, but the BSDs only allow
> > > that for
> > > a very small subset of file descriptor types, and doing it in a
> > > generic
> > > fashion seems very difficult (I tried a few years ago and gave up,
> > > but
> > > my knowledge of the vfs layer is minimal.)
> > Well, then we should go for the minimalist approach and just
> > add a hook to VFS. Multiple different ioctl()s are definitely a bad
> > idea.
> > An frevoke() looks much easier to do than one based on paths.
> > If I understand the issue behind the proposal correctly the caller
> > has opened the device.
> 
> Doesn't look like FreeBSD at least has an frevoke() syscall anymore, it
> had an FREVOKE flag, which is now a define for the O_VERIFY option
> which has quite different semantics:
> https://www.freebsd.org/cgi/man.cgi?sektion=2&query=open

Take a look at this implementation:
	https://man.openbsd.org/revoke.2

