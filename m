Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3392039F2E6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 11:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFHJyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 05:54:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:42252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhFHJyY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Jun 2021 05:54:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F9036124C;
        Tue,  8 Jun 2021 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623145951;
        bh=+h8Ay/FqmJ8ykvwzq3zqMVQg3ErjBbO72tDSSHd9JuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A1KtAcqrE4HQdJlrKeKfDPEt198+SKg4fsrGviTtIGBsnRIYt7XS0p8rmYsN7bAXi
         RPxFGqrI1VMBkr+k43GpqxC211Xij8gmj4ya7pc8zVPDoFzb3DuL8AAc7559kgVOe6
         JH5CCc6o+jyw3JPXCXJv/I/XbphVWSJItTSF4NUIWTCSK1Qgh8XOgZVY4s7hcRxg1M
         b9MCYxP5O7IN0dU3VVznD5qKJ+d7j0xCqX6dTBKpnemfpAClCzXR4hjgboUYkR+YL3
         pb4ErngCUeHfdgYwP7KUAXxly34JEZuyLYI2dtargD5xGMFxjJBcFbLusEO0rgfDqt
         /4yrWnhceQWsw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lqYPG-0008Uv-B7; Tue, 08 Jun 2021 11:52:23 +0200
Date:   Tue, 8 Jun 2021 11:52:22 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tung Pham <Tung.Pham@silabs.com>
Cc:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>,
        David Frey <dpfrey@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Pho Tran <Pho.Tran@silabs.com>,
        Hung Nguyen <Hung.Nguyen@silabs.com>
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YL891kPFMyolWibO@hovoldconsulting.com>
References: <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
 <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
 <YLtOL5aZUnntfqWB@hovoldconsulting.com>
 <CAAvkfd-o+g2_uc-HqK8svrU_E3NB1m03md8J_F_eTc8pDkXmdQ@mail.gmail.com>
 <YL5O6/GrlnpNwGjT@hovoldconsulting.com>
 <CAAvkfd91cdQ-6RwGErJuBTwQh9=8cajbngcOgjsThnFruz27DQ@mail.gmail.com>
 <CAAvkfd-mnb-g_ANwXeMn03rDfOSJrFkCREtPMGB=KZOUDg4gKg@mail.gmail.com>
 <9f7e4dac-dc1c-2011-2ddd-5debd32539fb@palosanto.com>
 <CO1PR11MB488227B08AC39755F22249C581379@CO1PR11MB4882.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CO1PR11MB488227B08AC39755F22249C581379@CO1PR11MB4882.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 09:10:51AM +0000, Tung Pham wrote:

> On Linux you can use manufacturing library to check firmware version.

Ah, I remember now that you sent a link to this application a few ago in
another thread.
 
> Then it display some information  of device:
> 
> Found 1 CP210x devices
> Device 0:
> Product String - serial number: "a0d16702d2a3e81187d86c93f375b2a8"
> Product String - Description: "CP2102N USB to UART Bridge Controller"
> Error: CP210x_GetProductString() failed to return Full Path, status = 0x2
> Product String (unsafe) - CP210x_GETPRODUCTSTRING_SERIAL_NUMBER: "a0d16702d2a3e81187d86c93f375b2a8"
> Product String (unsafe) - CP210x_GETPRODUCTSTRING_DESCRIPTION: "CP2102N USB to UART Bridge Controller"
> Error: CP210x_GetProductString(CP210x_GETPRODUCTSTRING_FULL_PATH) failed, status = 0x2
> Part Number = 0x20
> Firmware version = 0.1.1
> Vendor ID = 0x10C4
> Product ID = 0xEA60
> 
> The Firmware version is field that we need to looking for, it is
> formatted as major version; minor version; and patch.
> The A01 have range <= 1.0.4 version. It have error "3.6 CP2102N_E104 –
> IO Exception in .NET Applications when Manually Controlling RTS" as
> the cp2102n-errata.pdf have mentioned.

Thanks for the details and for confirming or findings.

> Our recommend is you can chose 2 options:
> - option 1: remove the set xon_limit and xoff_limit lines in driver,
> because our firmware automatically set these value to some default
> values (usually very small values) in its memory if it detect these
> values are zeros.

Yeah, this was the fallback option I had in mind, but the CP2102N I have
here then sent XOFF after having received only 7 chars or so when I
tried it.

> - option 2: archive Part Number and Firmware version, 
>    check if   (  (PART_NUMBER == CP2102N_QFN28) \
>     || (PART_NUMBER == CP2102N_QFN24) \
>     || (PART_NUMBER == CP2102N_QFN20))
>    and Firmware version <=1.0.4 set the xon_limit and xoff_limit to
>    zeros, other while set to other values. This option are more
>    suitable.
> 
> #define CP2102N_QFN28 0x20
> #define CP2102N_QFN24 0x21
> #define CP2102N_QFN20 0x22

Yes, we'll go with something like that now that we know how to check the
firmware version.

I guess it's even possible to implement flow-control support for these
buggy firmware revisions (by abusing xon_limit), but that would be a new
feature and not something that's needed to fix the regression.

Thanks again.

Johan
