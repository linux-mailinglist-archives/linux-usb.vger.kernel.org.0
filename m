Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A0E1B78BB
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 17:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgDXPBS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 11:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727808AbgDXPBS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 11:01:18 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04229C09B046
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 08:01:17 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d184so4922733pfd.4
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WA6YT3P4wx7X3bQJbhgUgPtFkkYdVN+8YI+AxYkVvfc=;
        b=BQlpqdhQGV2aylcPBuD0WjOIJNHbEqb2CFlIb4cMsMbgbjfR+pYTHxrKEc4X6YopRi
         YaAonVMgHeSm7M603hfMSD+ITnD05BfrISS3gjOz4Ys+sClTMVW66c5YTPTaZvRgWTAW
         X7ERXfDhq6MRjeEOa+0oWjU1q6NX9GqichShNmvdk+T4uSTCnc/mmakRUIS2bkkrJFH9
         4d7itlRbPD6LKT7ElUkPF2gKYKOsKstB4kuZhLZpgiNvVRlq8dqIiORSEcmV811M007Q
         XdkI2spnVddmK4KHVrVNdvmhRDFehykWLNx+8il9uWTTNbhOFYFbu9uJxLya5J4UAv/X
         HeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WA6YT3P4wx7X3bQJbhgUgPtFkkYdVN+8YI+AxYkVvfc=;
        b=tm0DNRoRUMwoEra7/7SDnZEZQtTy3yaNvfiRDVcZNmGV9KorYZlg2lfbEg/udY3N/c
         Q8D4hP/MbVvrrcsnD7wjQ6baYXarAyHKlc7/V4D5Mn/9BS6t9KRO/QSG8lQ5s2a24q3z
         Sqbt21Fjp34mbsmdORy5GR/L9BQsJ9fK+5jZQOFDcHHutkQNFNJDhEIeAqYH3XXgz1po
         4FPT/JrViyEY/59uifbFUZvDS4fTZ85t7swZ5s5WNhoNJEGodcNB6ITP6n9R6X+nAByb
         Z7fyncOpOFKLezutrOBmEZZo9zbAX8J39EPNPWWXPZHO+WteG4ZA1YNKp0nHU0gkRgcz
         0QpA==
X-Gm-Message-State: AGi0PubxZSm6kzmT0ajvdmHTJXZqdMolBWyK42we5S0pHBv/t21S1/2I
        YY+SLwlFyDwCYgUN628rrfcL0I9OlojWNw4aZia+7A==
X-Google-Smtp-Source: APiQypLXsA3W50M8onD0U1i/mkh4IibmkTCfMUte8KQKocdydeRyWNAG5+VViUHyykOfHWnzpsR+rVfhd1nfodcWZKc=
X-Received: by 2002:a62:4e87:: with SMTP id c129mr9959414pfb.178.1587740477173;
 Fri, 24 Apr 2020 08:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <9c99c508da044822baf53db5e3fccd4f21b0f8d3.1587734346.git.andreyknvl@google.com>
 <635f48fcb4bb99c70ab9d7f0dfe84d1ec7dc540e.1587734346.git.andreyknvl@google.com>
 <20200424133745.GA600581@kroah.com>
In-Reply-To: <20200424133745.GA600581@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 24 Apr 2020 17:01:06 +0200
Message-ID: <CAAeHK+yAzWj3n6WTcuDip+CN3tkbK6UrSUckBC1TEqtZJ_ou0A@mail.gmail.com>
Subject: Re: [PATCH USB v2 2/2] usb: raw-gadget: fix typo in uapi headers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 24, 2020 at 3:37 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 24, 2020 at 03:20:20PM +0200, Andrey Konovalov wrote:
> > Change "trasferred" into "transferred".
> >
> > Change-Id: I2d8d1dcc9ba6aacafc03f4b76caca7409a6da1a6
>
> What is that?  :)
>
> And no signed-off-by?

That's me mistakenly removing signed-off-by instead of the gerrit tag
:) Let me try sending that again.
