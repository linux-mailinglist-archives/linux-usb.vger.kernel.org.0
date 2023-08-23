Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B27A785373
	for <lists+linux-usb@lfdr.de>; Wed, 23 Aug 2023 11:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbjHWJFc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Aug 2023 05:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235136AbjHWJBx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Aug 2023 05:01:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12032D45
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692781031; x=1724317031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pz6oxOyuqgQh7qDrYn4w/2VAGFZ83BS4xwLtUri2vKk=;
  b=k5YXNQ4cm+QZ6/HKLBVgpiN0mK6Rn9NJ/EsyhaPqWZXBsWVF81Ej5mcl
   izLSpqjrZWzlcpOF1ZN62bkFtWXtVDkIKPeTX7718JHgSEMI/VRLcFw4C
   qXZndxzqc5RTcTm8d/U25F5ajxLMmQksUvhN0KABd5F0RoozgqEu6FjNJ
   yZmzVQH+vRd6dYrO2EXqrswCuGO55Sj0gRl5ylbOqaR0/snnN3W5Y2Cm4
   f5Pbxb55v2iwVmEsXbQARaJe1sqCzqJEpjZKkoZIgkuldR/FOzLS0gUk7
   MJ7NyNWsbtf1GreNIkPHbOV89YUvOjlpWX85nuMVl8B9+iO+GHz6ar53j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="354437051"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354437051"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 01:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880328194"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Aug 2023 01:57:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 23 Aug 2023 11:56:57 +0300
Date:   Wed, 23 Aug 2023 11:56:57 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Douglas Gilbert <dgilbert@interlog.com>
Cc:     Benson Leung <bleung@google.com>,
        Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C
 partner counterparts
Message-ID: <ZOXJ2cs5dUBsSNjX@kuha.fi.intel.com>
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
 <860a352c-12da-25ce-5b9e-697382a93899@interlog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <860a352c-12da-25ce-5b9e-697382a93899@interlog.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Douglas,

On Tue, Aug 22, 2023 at 10:52:12AM -0400, Douglas Gilbert wrote:
> On 2023-08-22 09:32, Heikki Krogerus wrote:
> On a related matter, I wonder why there aren't symlinks between typec ports
> (under /sys/class/typec ) and/or the corresponding pd objects (under
> /sys/class/usb_power_delivery ) to the related power_supply objects under
> /sys/class/power_supply . For example under the latter directory I see:
>     $ ls | more
>     AC
>     BAT0
>     hidpp_battery_1
>     ucsi-source-psy-USBC000:001
>     ucsi-source-psy-USBC000:002
> 
> Those last two power supplies are obviously connected to typec port0 and port1
> (but offset by 1). Those power_supply objects hold inaccurate data which I hope
> will improve in time. Significantly power_supply objects don't seem to report
> the direction of the power. Here is a little utility I have been working on
> to report the USB Type-C port/pd disposition on my machine:
>     $ lsucpd
>     port0 [pd0]  > {5V, 0.9A}
>     port1 [pd1]  <<===  partner: [pd8]
> 
> My laptop (Thinkpad X13 G3) has two type-C ports and port1 is a sink with a
> PD contract. I would like that second line to have 20V, 3.25A appended to it
> but there are several issues:
>   - no typec or pd symlink to ucsi-source-psy-USBC000:002
>   - that power supply_object says it is online (correct) with a voltage_now:
>     5000000 uV (incorrect) and current_now: 3000000 uA (incorrect). See below.
> 
>   ucsi-source-psy-USBC000:002 $ ls_name_value
>     current_max : 3250000
>     current_now : 3000000
>     online : 1
>     scope : Unknown
>     type : USB
>     uevent : <removed>
>     usb_type : C [PD] PD_PPS
>     voltage_max : 20000000
>     voltage_min : 5000000
>     voltage_now : 5000000

I'm glad you brought that up. The major problem with the Type-C power
supplies is that the Type-C connector class does not actually take
care of them. They are all registered by the device drivers, and all
of them seem to expose different kind of information. In your case the
power supplies are registered by the UCSI driver, and the above may
indicate a bug in that driver.

To improve the situation, I originally proposed that instead of
adding a separate device class for USB Power Delivery objects, we
would utilise the already existing power supply class. That proposal
was not seen acceptable by many (including Benson if I recall), and I
now tend to agree with that because of several reasons, starting from
the fact that USB PD objects supply other informations on top of power
delivery details (so completely unrelated to PM).

Even before that I had proposed that the Type-C connector class could
supply API for the drivers to take care of the registration of the
power supplies. I proposed that not only the Type-C ports should
register the power supplies but also the partners should represent
their own power supplies. That would make things much more clear for
the user space IMO. The port and partner would always create a "chain"
of supplies where the other is the supply the other the sink of power.
That is already supported by the power supply class. For some reason
this proposal was also not seen as a good idea at the time, but it may
be that I just failed to explain it properly.

Nevertheless, I still think that that is exactly how the Type-C power
supplies should be always presented - separate supplies for both ports
and partners - and that obviously the Type-C connector class should
take care of those supplies so that they always supply the same
information. Unfortunately I do not have any time at the moment to
work on this right now.

Br,

-- 
heikki
