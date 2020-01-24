Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B711148FDA
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2020 22:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbgAXVAr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 16:00:47 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:44878 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729604AbgAXVAr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jan 2020 16:00:47 -0500
Received: by mail-io1-f50.google.com with SMTP id e7so3338673iof.11
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2020 13:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=UlITP+nLm4otxb0HNjKcgULIGExg7DRjW9XZ4jBa830=;
        b=A3s3JrBlMqwGV5SJWtKcePh9D+u3u0vBwIH4rPPOWPSvHMKuzWJ+w5gf+DMuXk27ot
         hn4dZiWr2nN6fsuaGSL6RgLv+pEOP9hV2L5r5N7gvaX6D2A7S3nZMbqWxBIvP4Bj9g08
         4fxNBY4BBLv8WTsbtIA1bDKO8LvmcPuHcbTvS0Oh527T47OGQ4Mr9cmCFyAemAwlfFHz
         k3Yf0SmsYfsribI047Ek06+HGf1bmxfF3bpr09p4KN+qN9QSHQub3DCkqUVnfnsXwbkr
         c9M4I4rWAVy7VoGYW1koJolsuYlu3++Lj4cgBOQhOdP3dewaHlkAVRb4xDzDgzA7wPPL
         qMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=UlITP+nLm4otxb0HNjKcgULIGExg7DRjW9XZ4jBa830=;
        b=QPghqwLxrJCJk6BCajPJoTK7/BuVuu4Zp3mECU/cHpHWpJKsNUyPRN9TY3hgpv8VxM
         8MG/0TPwuXZ5wB5pnLs5lQBS2vxuO9R6WJ0wL5hnc/vuRsLeHt1IKQgVqaer8is5TA8S
         4QLLAKkWI9xYzqag+MzPVxoEUoW4tpDC0sBXOMsD3CC2oDzqCFnQ1KQzUs1eHNu2VyVS
         RUsegq1+njFBqBuwmCRwPh+k+ZtQbche1Epl2TMYFWVN+gtCPp/GwaUDbFHZbAzI3+6v
         2lafemqtBP4b0ySi1T74rolcUyedmLxgLk0aV+DJA70gQTMvQzurP3RO5mklRo0czeS7
         uj4Q==
X-Gm-Message-State: APjAAAUPwAaNZ7WlWAyOC7+v2zGdnP19PgdlXLWrdcCGhEOBgiNbTb79
        bIf4hnKXhAePzCxh1G9BD+jWatNP01ckrd7O86B4CE3e
X-Google-Smtp-Source: APXvYqxMddE+cRyc67H3CFK+xw769LkUIBdDGoaxFTZ0tCzeZMIChNRXH9I6RKJFkVPSj7W83OzJoulhKtGlTciLZqE=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr3545396ioc.306.1579899646443;
 Fri, 24 Jan 2020 13:00:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Fri, 24 Jan 2020 13:00:46
 -0800 (PST)
In-Reply-To: <Pine.LNX.4.44L0.2001241007350.1610-100000@iolanthe.rowland.org>
References: <CAA=hcWSKCryEZVhWptN9iz1dbh_4rMNp0X1LMop0SA7LjYWRVQ@mail.gmail.com>
 <Pine.LNX.4.44L0.2001241007350.1610-100000@iolanthe.rowland.org>
From:   JH <jupiter.hce@gmail.com>
Date:   Sat, 25 Jan 2020 08:00:46 +1100
Message-ID: <CAA=hcWSKXboOcvySVksL3eceRuWnPt=c7nv1gPPX3AQKgPGhCw@mail.gmail.com>
Subject: Re: qmi_wwan error
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On 1/25/20, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Fri, 24 Jan 2020, JH wrote:
>
>> Hi,
>>
>> I am running kernel 4.19.75 on iMX6 with a uBlox SARA-R4 LTE modem,
>> the modem manager is oFono, connect manager is connman. It could
>> connect to LTE between half hours to hours, then it dropped LTE
>> connection randomly, here are error messages, what could cause the
>> qmi_wwan status received: -71 and qmi_wwan usb_submit_urb failed with
>> result -19 errors?
>
> The most likely cause is that the modem's firmware crashed, or it
> disconnected itself electronically from the USB bus.  Or else somebody
> unplugged the USB cable.

There is no physical USB cable to connect to the device, the device
USB power supply is from its internal DC source which converted and
connected from external normal AC power. If it is a USB electronic
fault, the firmware is using Linux kernel USB, oFono and connman,
which one could be the source to cause the crash, Linux kernel USB
driver, oFono or connman?

I am diagnosing the issue, I try to narrow down the source to cause
the problem, is it fair to say that the higher layer software package
including oFono, connman or our software applications is unlikely the
source to cause the problem?

Appreciate if you could advise which components could be the issue,
what could be a solution to fix it.

Thank you.

Kind regards,

- jh

> Alan Stern
>
>>
>> [ 1018.944840] usb 1-1: USB disconnect, device number 2
>> [ 1019.072845] option1 ttyUSB0: GSM modem (1-port) converter now
>> disconnected from ttyUSB0
>> [ 1019.130834] option 1-1:1.0: device disconnected
>> [ 1019.142012] qmi_wwan 1-1:1.3: nonzero urb status received: -71
>> [ 1019.147909] qmi_wwan 1-1:1.3: wdm_int_callback - 0 bytes
>> [ 1019.153254] qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb
>> failed with result -19
>> [ 1019.228197] option1 ttyUSB1: GSM modem (1-port) converter now
>> disconnected from ttyUSB1
>> [ 1019.274475] option 1-1:1.2: device disconnected
>> [ 1019.340442] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan'
>> usb-ci_hdrc.1-1, WWAN/QMI device
>> [ 1022.827992] usb 1-1: new high-speed USB device number 3 using ci_hdrc
>> [ 1023.057165] option 1-1:1.0: GSM modem (1-port) converter detected
>> [ 1023.097815] usb 1-1: GSM modem (1-port) converter now attached to
>> ttyUSB0
>> [ 1023.157293] option 1-1:1.2: GSM modem (1-port) converter detected
>> [ 1023.178163] usb 1-1: GSM modem (1-port) converter now attached to
>> ttyUSB1
>> [ 1023.201251] qmi_wwan 1-1:1.3: cdc-wdm0: USB WDM device
>> [ 1023.243783] qmi_wwan 1-1:1.3 wwan0: register 'qmi_wwan' at
>> usb-ci_hdrc.1-1, WWAN/QMI device, 16:ed:38:aa:c5:90
>>
>> Thank you.
>>
>> Kind regards,
>>
>> - jh
>
>
