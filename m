Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704E1B8C36
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 10:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437680AbfITICk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 04:02:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27012 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390941AbfITICk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 04:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568966559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=omv7+mbGxPVf+0lSkKX4kVmao62GbbYXILt4i5WxIAo=;
        b=cPpu0jmGxZ7lWifVnLxUatezDsGss6+EFGFXoA7lsSaZSsgGjKQZfHqER1u5BjU8crAd/5
        pk/dJ6TVdhersB1HtWk3QhGTLoRevK/DSsmnFqVVI5U7bkUTPOcLMK3YcstJyF8Uum1r+S
        4jcNn6Xm+h1ui+6I+5fD+1GH9T4hjng=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-x-byZX-SOsm8EPmUV3NFEg-1; Fri, 20 Sep 2019 04:02:38 -0400
Received: by mail-ed1-f70.google.com with SMTP id y25so3676032edv.20
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 01:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y/OJqZHSGkyT8kFjd1lJtlh+ntUpVdhTuyPyBbh3g+w=;
        b=M/vmmeC+PfzFzidnyYnaJS1P7y44Psbvb4ZG669UhMNuUZdbSTygdOsO2azIbsFQgn
         8DikduTxNQr2Mo2z9LdgY6axcK/K7fKa3hNWMo6Laf6wU673qRQ21JFVz8PuTMb3jdn7
         fQJuAkAxIiXLim3VNwMPLurGJ6rFXH59Wq26+nm0qMMpeVf7n1OyPUjr6fn0scun9nUj
         zHU+5LhVD8BTqC2n9sO5ligXiZH3KsiLUO7N7U7HBnsoHIk3+7tqjD1WIl8lsTNRTASY
         odMW7MHQ/yHb/YKUoySlXCgUL+IYam1fN2mm7qNZueU8HYNKJrT/SxHMKys5zq5ttTqa
         R5gQ==
X-Gm-Message-State: APjAAAW2TXct5XxpYByRll+3Sc3O7knMXZASkIK33dgNVjU/Dw9W9Nvx
        ehrmqfeGdYyI98uYYUDF5i+8gra7Uw+i/sCq1U8xF/BUCzetwecjqSJPOG3onWe+eQTTJC30Xyq
        bNuDpBCRhVgUIxx5zOdWk
X-Received: by 2002:aa7:d718:: with SMTP id t24mr19310599edq.300.1568966556930;
        Fri, 20 Sep 2019 01:02:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWaaT9DrifLzV+dSh9GB8CGVoZ5eA0zf6DFmKbqgk48C0ZCbjACBj2Aw5MgUhmUfCQoK1VHg==
X-Received: by 2002:aa7:d718:: with SMTP id t24mr19310576edq.300.1568966556699;
        Fri, 20 Sep 2019 01:02:36 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id a50sm192418eda.25.2019.09.20.01.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2019 01:02:35 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] tcpm: AMS and Collision Avoidance
To:     Kyle Tso <kyletso@google.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, Adam.Thomson.Opensource@diasemi.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920032437.242187-1-kyletso@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cb225c94-da97-1b47-48b6-3802dc3eb93b@redhat.com>
Date:   Fri, 20 Sep 2019 10:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190920032437.242187-1-kyletso@google.com>
Content-Language: en-US
X-MC-Unique: x-byZX-SOsm8EPmUV3NFEg-1
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

May I ask how and on which hardware you have tested this?

And specifically if you have tested this in combination with pwr-role swapp=
ing?

Regards,

Hans

