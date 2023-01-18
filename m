Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E346D6726CF
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 19:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjARS0f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 13:26:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjARS0e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 13:26:34 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3851854217
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 10:26:33 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4a2f8ad29d5so479946007b3.8
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 10:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=833qF7g8LvqhqpatlwuROZztNoyMIiISRypz9Ugf/c0=;
        b=fW4W7Rj79IsrBXfq/8IyPW5hmnLVrANmQQurZBfP66+XEKzxsdPvQyznrjaydZ3Rme
         JVVQoE0xuV7m+0cl2I3Xhc7L72rKm35GAd73eeemoJJt1671F3L+IFUP7lxBD8eBWg9F
         gOn0ZsOILw46H9fiQOHvewyqTdeSDnyHkjvWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=833qF7g8LvqhqpatlwuROZztNoyMIiISRypz9Ugf/c0=;
        b=oKblL6eir7HKSs8Rz4PgfjvVvB/n5gDguugHqUe1S92D0wmkaE5P8yUHr8Tq2H8Raa
         Fvfsu4O30xhF2BqrW4d30mbqgpIfjU+GO9plOstW1yMKvnLfeKaXzIPiKy+GtY0a3Das
         wbML/r3Lv0hKcnLSfqy1nM+RAMPhPbVvzA/H4kYPkUsz8iu9n/2Ho2vK25kg840bRIN+
         TvuROP+NvDQLxHam64nuSz3Bpjtwjeu2RRzsnhk/6vOL63HSb0dYMcv8/d0D1NC9Jku+
         dPBRd4piT0LKTV52qSduEdWs5pYWvs17+iqVu/0Tvr9T5Tv1qNyyhSy1yHbI2y0XqwO1
         QAdA==
X-Gm-Message-State: AFqh2ko4/a2ocEps+d1x55ASSAGJwIZ6daWmvwdgFJqpEyYmOv9B1IfP
        HgnRJR4xls+BOFKXmgme1MoYS03Kj6teK/+b/HG6WczpZjLNjfgk
X-Google-Smtp-Source: AMrXdXvKMwvUyxaaa6SVXjJaCVv6vG8DoqKnn6zsV3pbWofoZQgF2Ozt9hB0EmH+XPmWBMdp9JBR9sS5yO/h46HMe0c=
X-Received: by 2002:a81:848c:0:b0:4e3:a9b2:55d0 with SMTP id
 u134-20020a81848c000000b004e3a9b255d0mr1172136ywf.197.1674066392438; Wed, 18
 Jan 2023 10:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20230118031514.1278139-1-pmalani@chromium.org> <Y8e+YlKiC6FHdQ5s@kuha.fi.intel.com>
In-Reply-To: <Y8e+YlKiC6FHdQ5s@kuha.fi.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 18 Jan 2023 10:26:21 -0800
Message-ID: <CACeCKafPzxYWh5a4xmeggc+4zRou73kHnwV-G5xMfQDheGgGdg@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: altmodes/displayport: Update active state
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bleung@chromium.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Thanks for reviewing the patch.

On Wed, Jan 18, 2023 at 1:39 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Jan 18, 2023 at 03:15:15AM +0000, Prashant Malani wrote:
> > Update the altmode "active" state when we receive Acks for Enter and
> > Exit Mode commands. Having the right state is necessary to change Pin
> > Assignments using the 'pin_assignment" sysfs file.
>
> The idea was that the port drivers take care of this, not the altmode
> drivers.

For the port's typec_altmode struct, that makes sense.
Should the port driver be taking care of the state for the partner's altmode
too, i.e "/sys/class/typec/port1-partner/port1-partner.0/active" ?

It seemed like the port driver should be forwarding the VDMs without snooping
the header, or IOW, it should let the altmode driver parse the VDMs (which it's
doing in this case) and manage the partner altmode state.

"pin_assignment_store" seems to only work if the partner's altmode
"active" bit is set to active [1]

FWIW, I think we can make the typec_altmode_update_active() calls from
our (cros-ec-typec) port driver too, but displayport.c is parsing the header
anyway, so it seemed repetitive. Just wanted to clarify the intention here.

BR,

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/typec/altmodes/displayport.c#n474
