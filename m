Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2FA425FF3
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 00:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241458AbhJGWee (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 18:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241394AbhJGWed (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Oct 2021 18:34:33 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A05C061760
        for <linux-usb@vger.kernel.org>; Thu,  7 Oct 2021 15:32:39 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id c20so7851212qtb.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Oct 2021 15:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPosGXG6aj5fiHXiB91n2H+d3yhrMgyk6caA7rCYuVE=;
        b=TyzCOLeOsNH+ATbCv+mObEZBqB2Q+42LxF3uXOIU4JqOxFv0Suf1hxARW3mECKJGbk
         6W72juLLE8mx0B8j0TBIaZ70diDCJy7C1/EwOenCENtB5NKYV4Zt3tTGu6I9cXLJd6yw
         tgDL6K6e0bH6GRVNl69irNRt4P+TW75No5eE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPosGXG6aj5fiHXiB91n2H+d3yhrMgyk6caA7rCYuVE=;
        b=Ufo3DZHw3Iv7riKHBNWyuudposkYdNPTgxxnNE6xqGPJ6hB48MGUWByX2Z9uAOtlb4
         0YowpfJ8ddtq1hUsBvC3eYmBNb0dJmA/d5CkZyw21c2lX+DsMqPA5MxD/TbIZJCnmMVe
         8naBdsL6wMQrI75SsA7th7CNleSLMosIxQN5YZUY2XmYXdnSMyEx3c9ouHOs2FgtJRwt
         9zT1ehWJJV8xsvzLUnC2g5Hy/ceIeP7Q2ZRJzIM04OlzyrTtKUsECv/L3TTS2HuiLlYE
         bmMWY6ief53W7X5q2p2UMDfOV9RR/nXOIvF0Y+l415gWiOk0IltrDQPDKdsI+xdXbLv9
         CsMQ==
X-Gm-Message-State: AOAM532kTqyg/tO38EAvDXdGoUqo/UIOScBooi/3fjUCnVCKxy7DzbV5
        HoNbW3HJqbFBqE4SxrCTAvr5VtYp6ZGLtWLSc9CUUw==
X-Google-Smtp-Source: ABdhPJxtMWrNq05xIwSXYzJOaS9tLcGh48Df1ypUB9oB6RjXV44VM0Ys6C+Vs5hx7Kz9jJbv7p9rXESJopZRntEsEdI=
X-Received: by 2002:ac8:4347:: with SMTP id a7mr8044529qtn.169.1633645958484;
 Thu, 07 Oct 2021 15:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210902213500.3795948-1-pmalani@chromium.org>
 <20210902213500.3795948-3-pmalani@chromium.org> <YT9SYMAnOCTWGi5P@kuha.fi.intel.com>
 <DB9PR10MB4652B4A6A2A2157018307AE380D99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <YUB16up3JDwi3HfI@kuha.fi.intel.com> <YULwz8NsoA3+vrhA@google.com>
 <YUMbGp0aemx1HCHv@kuha.fi.intel.com> <DB9PR10MB46525E6CA4C6BB101059D93C80DC9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <YUm5sdbceMcDTvYj@kuha.fi.intel.com> <DB9PR10MB46524E3817FB4D836CDC13E180A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB46524E3817FB4D836CDC13E180A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 7 Oct 2021 15:32:27 -0700
Message-ID: <CACeCKaem93dbJ11qOG=a+MkJhSrp0Nx-UAPG00Q-5WwMriJD0A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] power: supply: Add support for PDOs props
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "bleung@chromium.org" <bleung@chromium.org>,
        "badhri@google.com" <badhri@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks,

Thanks for the comments and discussion on this RFC series.

On Fri, Sep 24, 2021 at 8:38 AM Adam Thomson
<Adam.Thomson.Opensource@diasemi.com> wrote:
>
> On 21 September 2021 11:54, Heikki Krogerus wrote:
>
> > If we can leave the decision about the selection to TCPM, that would
> > be great! I'm not against that at all. As I said, I have not though
> > through the control aspect. Right now I'm mostly concerned about how
> > we expose the information to the user. The only reason why I have
> > considered the control part at all is because how ever we decide to
> > expose the information to the user, it has to work with control as
> > well.
>
> Well part of the discussion has to be about the role that the user plays in
> the control. What does and doesn't need to be controlled further up the stack,
> and what will be taken care of by, for example, TCPM? Surely that dictates to
> some degree what and how we expose all of this? Right now we have a simple means
> to read and control voltages and currents through a PSY class, without the need
> for the user to know any details of what a PDO/APDO is. Do we continue with
> abstracting away to the user or instead let the user decipher this itself and
> decide? Am just trying to understand the needs going forward.
>
> > The final PSYs and the supply chains they create as well as the
> > individual properties I'm more than happy to talk about, but having a
> > separate object for the smallest thing that we can see (PDO) is the
> > right thing to do here IMO. Trying to concatenate things into single
> > objects especially in sysfs, despite how nice it always would seem,
> > has taken me to the brink of disaster in the past far too many times.
> >
> > In this case we don't need to take the risk of having to duplicated
> > information or in worst case deprecate something that is also exposed
> > to the sysfs in the future.
> >
> > So the question is not why should we registers every individual PDO
> > separately. The question is, why shouldn't we do that? And saying that
> > it's "heavyweight" I'm afraid is not good enough. :-)
>
> That was my initial feeling on the suggestion based on the idea of a PSY per PDO
> and I still don't feel that fits as your creating a whole class of resources
> to expose something that's pretty small. To me the PSY represents the source as
> whole, and the PDOs are simply options/configurations for that source. If we're
> needing to expose PDOs then I don't disagree with separating them out
> individually and I certainly wouldn't want that all concatenated as one
> property. However I think something like dynamically generated properties
> might be a nicer solution to expose each PDO, or even groups of properties if
> you wanted to split PDOs even further into constituent parts to the user.

To downscope this issue for the time being, one of our immediate goals
is to expose the PDOs
to userspace for metrics reporting and potentially for some power
policy control through other
channels (like Chrome OS Embedded Controller).

Would it be acceptable to revise this series to drop the power supply
support for now (since I don't yet
see a consensus on how to implement it for the partner), and just add
sysfs nodes for each PDO ?
This would be akin to how it's being done for identity VDOs right now.

So we would have :

/sys/class/typec/<port>-partner/source_pdos/pdo{1-13}

and

/sys/class/typec/<port>-partner/sink_pdos/pdo{1-13}

and similarly for the port device.

If we want to add additional parsing of the  Fixed Supply PDO into
individual properties for the partner/port,
those can of course be added later.

WDYT?

Thanks,
