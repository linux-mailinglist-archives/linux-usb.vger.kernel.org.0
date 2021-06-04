Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B6439BD5F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 18:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFDQj4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 12:39:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhFDQjz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 12:39:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 280CB610E7;
        Fri,  4 Jun 2021 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622824689;
        bh=bOujUclqJltsqOHO8Qu3Mdg8zc3fiFOk7UadCcTjBEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lvvT1b8PAHFpi06EgI8IeQYo7BXrxM5GZM+7eZ2LTJsn/g/WMkSzjOZVOLC4cUrYI
         BWBmMDZ/Ag7OkclfBziqW2u6opkCej4sObTziXpWHU9PfizLNSL6ngulm1FuLHyyE9
         OdBkfq+1QeJBJDSFPUiLH5SnbmVUaG2GogHZqy4UypIAEO7mlmc4VmG4WHOr5p10A5
         glvGKtoDPUYSxFEHMquWYumaGx/vIR8a10B0z7kBrx5DKB8yzqqQqA+XGTHT5ZnKJ5
         rJW40A4osnw83S0DRoCDv3gNCoFR0oQwjS9diY1YxPqu2ACZVfvW2xDU8u8/TXcPNA
         VDjC63k0k27dQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lpCpl-00066C-6F; Fri, 04 Jun 2021 18:38:09 +0200
Date:   Fri, 4 Jun 2021 18:38:09 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>
Cc:     David Frey <dpfrey@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: CP210X: Failure while programming ESP32 dev board
Message-ID: <YLpW8Xo6k3mwEmVr@hovoldconsulting.com>
References: <CAAvkfd_vPHcd5CTLrA_BoVhg_aNWNzcp45yO-dCpJZhyabjjsg@mail.gmail.com>
 <YK4T+w+e8TtAUuEo@hovoldconsulting.com>
 <CAAvkfd91qr+aQQxXyQfk1e2Avifcdp6fCwgrk3c7=ex3pcqvPw@mail.gmail.com>
 <6a6d0902-02ea-b144-6275-a44ed4b756ee@palosanto.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a6d0902-02ea-b144-6275-a44ed4b756ee@palosanto.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 03, 2021 at 05:56:32PM -0500, Alex Villacís Lasso wrote:
> El 3/6/21 a las 16:48, David Frey escribió:
> > Hi Johan,
> >
> > I have added linux-usb@vger.kernel.org to the CC as requested.
> 
> > It appears that in the 5.12.8 kernel, there is a failure every time
> > cp210x_tiocmset_port is called resulting from this:
> > ret = cp210x_write_u16_reg(port, CP210X_SET_MHS, control);
> 
> Sorry to butt in, but if you are comfortable compiling kernel code, try 
> manually reverting only commit f61309d9c96a308465bec9d2e5206da265b075a0 
> (USB: serial: cp210x: set IXOFF thresholds) and loading the resulting 
> .ko module. I do that to keep working in my ESP32 projects while this 
> issue gets a proper fix. More details at bug report at 
> https://bugzilla.redhat.com/show_bug.cgi?id=1965527

Yeah, that would likely work here too.

> Just a guess: maybe ulXonLimit and ulXoffLimit should only be non-zero 
> when actually enabling software flow control, and must be set to zero 
> otherwise? The faulty commit just assigns them unconditionally to 128.

I had the same thought and that's why I asked you to try setting ixon
and ixoff using stty. Unfortunately, that didn't seem to have any
effect, judging from the last logs you sent me.

Johan
