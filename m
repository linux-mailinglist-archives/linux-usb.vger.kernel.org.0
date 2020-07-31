Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C394E233F8A
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 08:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731551AbgGaG7q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 02:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731547AbgGaG7p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jul 2020 02:59:45 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B71C061575
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 23:59:45 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id t187so6713300vke.5
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 23:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Dzb4qikGnC7PJc3yHKTz13us3kdcfG1rOFTmBMSQwo=;
        b=Db2WsUckgXvkpgsukQSgRbIsZRyOiXhG1OVbXKRN6hIiui1861e4zH+ggX4jEwHPYF
         pgoAXPIpvfAzJMRJKP6I40Q9K57Qy3Dium732+ysCRaRsFi2BlHIL8gkvvA0EEh8sQ2f
         LXpKGuKYosVTw1N3Wxkw1kWP2nvyPFGmDMNAzIEsxfaGRFwsEVvAmU1vS2lHlprw29CC
         hKg2H7ZRwoRpCVQ/dvIXsKFYwhc/ozuGtWcizhaXRctAzBijm6v80RKksTXWCOlUdAlS
         lhvwVHyOABtVAdYK/CvtmV5dYzQINqOP9fbA3EuOgEP7ywoqx+IE8hQBoU+y5iy2Ocxt
         ELYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Dzb4qikGnC7PJc3yHKTz13us3kdcfG1rOFTmBMSQwo=;
        b=SmOYbnyEZA9CSCxYCzXG3VafoiVZqfAbVQgdjyeD5L54opaDM8PV9x1EIPiMwdLI65
         vE8HZ0vAKjU7dTuDUlI2/sAFA7EPVoV1F9Bg91KDt8GqztcW/eth8htlrKaFhj02eTOt
         zmUx7ll3iKzWrgwXfDGnOAO1Eg/t85r0l0wvkpELqCPIm/ZkV1yCvU6SMpg6sVUVy4C1
         UHaIdE7VYosEQLjoAS27QeUx9KA1VQvmE2zcJE5tWJ/kCWbg6tU92vIpOSum9jdddF8D
         8BmTzet6bBRsqxoNsAKgMPqp4Nez3us1kWQpv4CAosYQvBP9J4CPYYytDc6VGzGMdkta
         2eUw==
X-Gm-Message-State: AOAM532FWVQTHcgTjmkJ4Ajs9x3NTv61pDMuwHu4VAUgs/0u2uCAmcXY
        GOUppdtNC4KH/YqjiZm3rjJ4LnCsiZE5Wwh5+MoZsQ==
X-Google-Smtp-Source: ABdhPJz4xTSNBFzKm8MK/dWshaCLtJsQmyXj9v/1SQl7ouSkIU3MSRKmN2e3pzeqtSiN8SoMdvp33CGLgFgV3pEO9aU=
X-Received: by 2002:a1f:de81:: with SMTP id v123mr1704997vkg.92.1596178784465;
 Thu, 30 Jul 2020 23:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200730072531.3171984-1-badhri@google.com> <20200730123431.GO883641@kuha.fi.intel.com>
 <33bec771-7255-517f-fb5f-9c4e7320837d@roeck-us.net>
In-Reply-To: <33bec771-7255-517f-fb5f-9c4e7320837d@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 30 Jul 2020 23:59:08 -0700
Message-ID: <CAPTae5L8UGUqCg4h6BuGRk7_OH1HkXmoirACqzGKRhJfj6ZuHA@mail.gmail.com>
Subject: Re: [PATCH v4] usb: typec: tcpm: Migrate workqueue to RT priority for
 processing events
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for catching that !!

On Thu, Jul 30, 2020 at 9:05 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/30/20 5:34 AM, Heikki Krogerus wrote:
> > Hi,
> >
> > One more nitpick below...
> >
> > On Thu, Jul 30, 2020 at 12:25:31AM -0700, Badhri Jagan Sridharan wrote:
> >> @@ -4786,10 +4807,28 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
> >>      return PTR_ERR_OR_ZERO(port->psy);
> >>  }
> >>
> >> +static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
> >> +{
> >> +    struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
> >> +
> >> +    kthread_queue_work(port->wq, &port->state_machine);
> >> +    return HRTIMER_NORESTART;
> >> +}
> >> +
> >> +static enum hrtimer_restart vdm_state_machine_timer_handler(struct hrtimer *timer)
> >> +{
> >> +    struct tcpm_port *port = container_of(timer, struct tcpm_port, vdm_state_machine_timer);
> >> +
> >> +    kthread_queue_work(port->wq, &port->vdm_state_machine);
> >> +    return HRTIMER_NORESTART;
> >> +}
> >> +
> >>  struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
> >>  {
> >>      struct tcpm_port *port;
> >>      int err;
> >> +    /* Priority just lower than default irq thread priority */
> >> +    struct sched_param param = {.sched_priority = (MAX_USER_RT_PRIO / 2) + 1,};
> >
> > Move that outside the function and constify it:
> >
>
> Good catch. With this change applied:
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> >         static const struct sched_param param {
> >                 .shed_priority = (MAX_USER_RT_PRIO / 2) + 1,
>
> Caution: s/shed/sched/
>
> >         };
> >
> >>      if (!dev || !tcpc ||
> >>          !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
> >
> > thanks,
> >
>
