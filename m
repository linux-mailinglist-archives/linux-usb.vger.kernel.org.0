Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B67D610D650
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2019 14:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfK2Nvq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Nov 2019 08:51:46 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42408 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfK2Nvq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Nov 2019 08:51:46 -0500
Received: by mail-lj1-f195.google.com with SMTP id e28so7911055ljo.9;
        Fri, 29 Nov 2019 05:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r/Fi0MEV5r+tBjNoZsXiqWGS8fmABPhyE3GLMwdmTOs=;
        b=A9aOx9cEixFVBs4U7f43jObb7HqMvxNxX9koUHd5bYC48PoJUB5V9r+aDgdAOTSXTS
         QqT9/+g50Dx4MlMHWN4mMXAlli+XgrGnUEq36CVd90f8F8VRQoeODYPUIXUHUAsxSkBy
         Y9IlQfTCdxmXDVbR7vyVugDCb1PbnvIMaz9KhvU3w+bmbsM+6X8EQ8DAi8KCbW7Sl8C4
         IYKaeHxOQGs6NoT/fWVrb4QoX4mZylE+p79c5Sevz4FTAHHVv4/GJjjqPda6MgarT6Od
         IYAmUV5WSGyoT/iYdp387sCXEwGLfWFbwVBQHm/WNq/C5vGUHH3pvwf7PTj58VugzYmG
         L5kw==
X-Gm-Message-State: APjAAAUFkfW0LtN7xEplIoLpYE4BTwtOgqOprObUGvWq1Rof8zvBf4bA
        3w+jhLloJb5vEsnOk57ST4I=
X-Google-Smtp-Source: APXvYqzYOIhahw5q4/27xdaWNr1ynP0NYIT6X4+7RsS/yjJYtt4WrdyvUoYMvOR/STunO0LIzBZ0Kg==
X-Received: by 2002:a2e:7013:: with SMTP id l19mr38235479ljc.201.1575035504338;
        Fri, 29 Nov 2019 05:51:44 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id u7sm3157258lfn.31.2019.11.29.05.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 05:51:43 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iaggT-0005iP-Ue; Fri, 29 Nov 2019 14:51:46 +0100
Date:   Fri, 29 Nov 2019 14:51:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: gigaset: fix crashes on probe
Message-ID: <20191129135145.GJ29518@localhost>
References: <20191129101753.9721-1-johan@kernel.org>
 <20191129133239.GA3703941@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129133239.GA3703941@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 29, 2019 at 02:32:39PM +0100, Greg Kroah-Hartman wrote: > On Fri, Nov 29, 2019 at 11:17:49AM +0100, Johan Hovold wrote:
> > Syzbot has been reporting a GPF on probe in the gigaset ISDN driver,
> > which have since been moved to staging.
> > 
> > The first patch fixes that issue, and the next one fixes a second crash
> > found during testing.
> > 
> > The third patch addresses a benign warning in USB core which syzbot is
> > bound to report once the crashes have been fixed.
> > 
> > And while I hate playing checkpatch games, the final patch addresses a
> > checkpatch warning introduced on purpose by the third patch.
> 
> I'll take these after 5.5-rc1, but then it is time to just delete all of
> drivers/staging/isdn/ from my tree, so don't worry about them after that
> :)

Sounds good to me. :)

But we should probably get these backported before dropping
staging/isdn. Not sure if syzbot is run against older stable trees as
well, but if so, you may want to consider adding a stable-tag also to
patch 3/4.

Johan
