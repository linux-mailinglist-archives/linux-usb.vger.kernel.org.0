Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA852F4BDA
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 13:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbhAMM5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 07:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbhAMM5M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 07:57:12 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E09C061786
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 04:56:32 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id r5so1757700eda.12
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 04:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBqxWETED3zyFah6mwQlqxDt9pUB3DVw5BAQx6UfgV0=;
        b=r+tJlbxzp2Rz2Eepi1Uuq2YolW7Qsy4dsVM6ATIWKdfpP7lC7YlkBeA8nAVw1sW1/s
         jeeUwDoNiyKWO1oAS0vd9BVzh3xZdV0+3eUoEmSaPwATM2PHp1xxPhZRD3ririkUBaHm
         ckbS91v3E9GWk7xxVQA+/UG9GOafdDvG6ETF4I5J7vrXAo/Pa8OUfEl9zgKkR3SKom0c
         /pLQcicpWpTwEdKOSAe70Dd91yJVrE1V+PEw9ZXuCmGYRowt/fgghZLup4l5IbUBhu7i
         +ehmxBL3OBNdZYT2084huWCSIiOCX7IxXyM8oeJfKG9sZMgujQsQqO8TPIlBZQc0oUTh
         JWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBqxWETED3zyFah6mwQlqxDt9pUB3DVw5BAQx6UfgV0=;
        b=Qxlc1l7CpdeS129KmE0OmSRIYXkLKdy9sKM4jGlyauFEd7uIUN4vZWsFu0G4WdZhco
         /Q3rt9MTAwk1lOJkk5FnnWGi+ANVH+4yKzrocZWEwSft/kuecgO+vMTtO7m7n87R1QzT
         FQf+RRrOWlCcvlxh+kF8ZW0o9OqTGUQ4BiQBxpDG8NRrh+GjILmIO5FhtysNGHkUYnNb
         26zmo66Y1jPIwbnkaeZg7E6Lh0Gc196Sdu81jQWeO6yx/BT4jaA2bJ/Uui0UQDJptwAc
         A/yP22OrKfPYD0K7XxfP7f4uVFhq+wvACEPVLzD+YI8hKBUDg+7M+mbefRxsNze2/jcB
         R0sg==
X-Gm-Message-State: AOAM531nqjQ/5Hdiwr1Lbd9ScLuvAcs/O4KSdyu4qRETBznHq7QxGsK2
        Uuf/4aAEWIuXFv5VNR4KyzRJl+gueUFCjHo2Nzo=
X-Google-Smtp-Source: ABdhPJzuweX8CepmnyQr+lTuSEq3y4P2PwHaVsk01EwKDJpvBvPcc83gyIm9FL2nNAkUaDl5UGB9gMI/Olvxox/APVY=
X-Received: by 2002:a50:bacb:: with SMTP id x69mr1643601ede.39.1610542591133;
 Wed, 13 Jan 2021 04:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20210113100750.32692-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20210113100750.32692-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Wed, 13 Jan 2021 14:56:14 +0200
Message-ID: <CA+CmpXscND_KCPj0yX=OEBW3=NibX3jDc3uKzcpTnVCL4c5AEw@mail.gmail.com>
Subject: Re: [PATCH v2] thunderbolt: Add support for de-authorizing devices
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Mario Limonciello <mario.limonciello@dell.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 13, 2021 at 12:07 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> In some cases it is useful to be able de-authorize devices. For example
> if user logs out the userspace can have a policy that disconnects PCIe
> devices until logged in again. This is only possible for software based
> connection manager as it directly controls the tunnels.
>
> For this reason make the authorized attribute accept writing 0 which
> makes the software connection manager to tear down the corresponding
> PCIe tunnel. Userspace can check if this is supported by reading a new
> domain attribute deauthorization, that holds 1 in that case.
>
> While there correct tb_domain_approve_switch() kernel-doc and
> description of authorized attribute to mention that it is only about
> PCIe tunnels.
>
> Cc: Christian Kellner <christian@kellner.me>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---

Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>
