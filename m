Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 141B5C9AFA
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 11:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbfJCJr2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 05:47:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47625 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728966AbfJCJrW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 05:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570096040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Slr5vJy6mbyz1qs6FInoT5bsgy6V9VipGUl+FsYhiIY=;
        b=Nv81P6T6FYn9cQ/lhjI9K31MxqrWVviIHBbPAUvw0twpKu5FGeiRqXXaFm3lUiVxRAcgtP
        1/JELNkuaNlWL9AIsSPPihcBoWoB8bWfu7h3AG/VYV/cwX3S0DtIVe05dns0tzpJkK5v46
        zfSkYiSlkbwfPl5rS2MIjftuvv4OI60=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ZOx5b6eSM4yObOSCJEaVDA-1; Thu, 03 Oct 2019 05:47:18 -0400
Received: by mail-ed1-f72.google.com with SMTP id c90so1247915edf.17
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 02:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5u7AYILS1XoHJtXlAmd4z9JODYl7wd80zKyrfd1Qcsk=;
        b=FRzh8cmPqIUcYHl9sT9XIu1m9Tmm4KmHmePPaqxyc0kjuVZVedkhZxtP4r+0TF8YSY
         imb3tvpnCt64DHak/3lu0FIUZIe+MnwFi2A9qDIYLgZOdTthwqxrs+RzmJ7egH6vXCr7
         vX0eKVvBW3gD5vmv+f9J5oqCHQAa7Ldpe5QT4fWnpVAcvi6nCwnwtLdju4Sf0Db0nJV1
         FKxi8r1Uxi0oPXyQ1lSCigBxawsoGPQHjuWHprxnQf4fZktVLsrLFDPBQhS33Uhvd23F
         chuydhQoSO2v1k2CoPoleBSU/W45eeEKH2SgfsqIPMPejs8APExrKi0eY0Ch2Yc42PA6
         IgNg==
X-Gm-Message-State: APjAAAVbv4qP5foCLQNX8lR+O5j+1rloiusWveEY+oUahWdDHb1ZLMf5
        5vJpc2hM395ttTxn8YuMhwO/tSKySGPAAIujmxYXZ6ZMDFsoUH8HXhGZJPGnySd4VKQidE86jmz
        LjShovdKgO55UwypV395S
X-Received: by 2002:a17:906:d04f:: with SMTP id bo15mr7072172ejb.296.1570096037499;
        Thu, 03 Oct 2019 02:47:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5TM/uO//Q6CLjKMwfsNTO7vdU4B0OhTH/gHaatMNw6g6IwUxAmkhGvfOv8PJ7Si/jqoeBmw==
X-Received: by 2002:a17:906:d04f:: with SMTP id bo15mr7072161ejb.296.1570096037244;
        Thu, 03 Oct 2019 02:47:17 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id 30sm371562edr.78.2019.10.03.02.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 02:47:16 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] tcpm: AMS and Collision Avoidance
To:     Kyle Tso <kyletso@google.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, Adam.Thomson.Opensource@diasemi.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920032437.242187-1-kyletso@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bd03390e-35fb-2885-d026-b8df58f02283@redhat.com>
Date:   Thu, 3 Oct 2019 11:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190920032437.242187-1-kyletso@google.com>
Content-Language: en-US
X-MC-Unique: ZOx5b6eSM4yObOSCJEaVDA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Kyle,

On 20-09-2019 05:24, Kyle Tso wrote:
> *** BLURB HERE ***
>=20
> Kyle Tso (2):
>    usb: typec: tcpm: AMS and Collision Avoidance
>    usb: typec: tcpm: AMS for PD2.0

I've finally gotten a chance to test this on one of my own devices
which uses the tcpm framework for its Type-c port.

I am afraid that this series breaks DP altmode support,
specifically, the dp_altmode_configure() function no longer
seems to get called, leading to no pin-assignment being
selected by default and DP thus not working.

So sorry, but I have to NACK this series since it causes
regressions.

It might be easiest if you can get yourself some hardware
which supports DP altmode and uses the fusb302 Type-C
controller (which unlike your controller is actually
supported by the mainline kernel).

2 devices which have this are the original (version 1)
of the GPD win and the GPD pocket. Since the version
is not always clearly marked, make sure you get one which
has a X7-Z8750 CPU, those are the version 1 models, you
can still get these e.g. here:

https://www.geekbuying.com/item/GPD-Pocket-7-Inch-Tablet-PC-Intel-Atom-X7-Z=
8750-8GB-128GB-375711.html
https://www.geekbuying.com/item/GPD-Win-Intel-Z8750-Windows-10-4GB-64GB-Gam=
epad-Tablet-PC---Black-378018.html

These 2 devices still need 2 minor patches to hookup the DP
support, I have just finished these 2 patches up and I'm
submitting them upstream today, I will Cc you on these.

If you combine these with one of the many DP-charging pass-through
+ USB-3 out + HDMI out dongles, e.g.:
https://www.aliexpress.com/item/32953320909.html

And then after plugging in do:

cat /sys/class/typec/port0-partner/port0-partner.0/displayport/pin_assignme=
nt

This should print:

C [D]

But when I add your patches into the mix it prints just:

C D

And these debug pr_err calls never happen:

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/a=
ltmodes/displayport.c
index 7845df030b72..d14f94078dd9 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -106,6 +106,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, =
u8 con)
  =09=09break;
  =09}

+=09pr_err("dp_altmode_configure pin_assign %08x conf %08x\n", pin_assign, =
DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
  =09/* Determining the initial pin assignment. */
  =09if (!DP_CONF_GET_PIN_ASSIGN(dp->data.conf)) {
  =09=09/* Is USB together with DP preferred */
@@ -115,6 +116,8 @@ static int dp_altmode_configure(struct dp_altmode *dp, =
u8 con)
  =09=09else if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
  =09=09=09pin_assign &=3D DP_PIN_ASSIGN_DP_ONLY_MASK;

+=09=09pr_err("dp_altmode_configure masked pin_assign %08x\n", pin_assign);
+
  =09=09if (!pin_assign)
  =09=09=09return -EINVAL;


Regards,

Hans

