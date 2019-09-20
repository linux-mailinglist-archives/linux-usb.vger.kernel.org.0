Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F756B8C7F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 10:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395156AbfITIUA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 04:20:00 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33478 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389952AbfITIUA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 04:20:00 -0400
Received: by mail-qt1-f194.google.com with SMTP id r5so7757800qtd.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 01:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3SocQEUUMkK769LhW2Pd9m5ZQqfoBNJ10901hl/4ay4=;
        b=nLw1HL3elE8+Sl+dCKaY9ufcrvHnF8x33T1asuG5/yPil0hxbSfwf1Wp4ZcsEm9kKV
         6lBc0znEAm2vAWbqhqnMjBi3jZsfmj0teBImHoavMyHXPXWJLD7Xo5PowPkCZ+0hmZ9+
         fxnsAJQ9ihkQJZFVslAaafYyAx3QfmIinfhxhPiyCeb7Dv1hC5dobbi3BFuQZPljAiDH
         P+xA1GZFp6o4HDRHq2V9L8olN04Lwa7iz6Sn5JUH0GoA+zhoOq5FD+JEXu0/+RCc34nF
         yyCniL7e/t4BxT8qVfk8q76UZiA8iYPkAQqURVCTZc/oG72GX2Tl/Daro/+anIkcYmC9
         ST5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3SocQEUUMkK769LhW2Pd9m5ZQqfoBNJ10901hl/4ay4=;
        b=L4kfj050HA/ytc/JLiF/13Q2ILtbIXezuumvqnYdxoyEiz3aogXK0KbaG6IUcATblo
         1NRj8LPdi+Iq2WDUYHY8jo3/2/C0d5cmovdbqIW77YPYjfsYrVmngVffHQU3b6ku5Ndy
         Z4Pnh5kkAaYHD2ml8BwihibDzVPqXCEfuiantcuTnAIpzGjdWZrKM9TyLrosUqysNrVP
         QH6CoGBZBWEgwTtRMa3AudkVp77B9226CDePTNXewL3Zya+CrACkFuvK//Eww1sz4vow
         BchPhyIWQGwO5L/yO0DuRKtflQd8tOjS6+iPTSQduamPLevFY6BU2vs7K6WYKWChB1uY
         Y+GA==
X-Gm-Message-State: APjAAAXtDmH6FsQjY86v6+qq9O0s9RFmn7QO4zAQ320x2E1HTkBe/kHS
        kOvJj6pG8zZcXfDI3XKpIpwwP1Qe9yUhEd2uvC7s9Q==
X-Google-Smtp-Source: APXvYqwlO5TN7aw8zddGqA6dfFkWBaGlE6Zgfrdslwr71Wxgag4BouCltVzFfmnE4S6FPXI8LDpPdjgihPX+lyfXNZQ=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr12063122qvo.146.1568967598534;
 Fri, 20 Sep 2019 01:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190920032437.242187-1-kyletso@google.com> <cb225c94-da97-1b47-48b6-3802dc3eb93b@redhat.com>
In-Reply-To: <cb225c94-da97-1b47-48b6-3802dc3eb93b@redhat.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Fri, 20 Sep 2019 16:19:42 +0800
Message-ID: <CAGZ6i=3O2zLJMPY5UevjTrJJj7fxpWcn28dZYRptWES74=4Tgg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] tcpm: AMS and Collision Avoidance
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

I have tested these on an Android device (ARM64).
All the swap operations work fine (Power Role/Data Role/Vconn Swap).
(except for Fast Role Swap because it is still not supported in TCPM)

Regards,
Kyle Tso


On Fri, Sep 20, 2019 at 4:02 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Kyle,
>
> On 20-09-2019 05:24, Kyle Tso wrote:
> > *** BLURB HERE ***
> >
> > Kyle Tso (2):
> >    usb: typec: tcpm: AMS and Collision Avoidance
> >    usb: typec: tcpm: AMS for PD2.0
>
> May I ask how and on which hardware you have tested this?
>
> And specifically if you have tested this in combination with pwr-role swapping?
>
> Regards,
>
> Hans
>
