Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE88FCFBBC
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 15:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfJHN73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 09:59:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29281 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725821AbfJHN73 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 09:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570543167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YFFTjSOexeHMooQarjHjyr2PYTne3A1VZs/EDwqMyEM=;
        b=eCX7Fxm1jMlvHnos1iyvUVqFi78Q+6mgXEw90WBP1vQvjx6Okoq/Fhdc0V4R3cfYfm1kwl
        fiFnO7VRby0EnWq3nY5Yg8ii9Nc47k0menxrf6rhJHyNcPEDZWAzozYwv4MBxK2qqdJ4CY
        sFFPy6pOvO7gcdJOU7FEfgdArYEASW8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223--whFVIG8O_aJzVORDOMv9w-1; Tue, 08 Oct 2019 09:59:25 -0400
Received: by mail-wr1-f72.google.com with SMTP id n18so9152276wro.11
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 06:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aqfqD77jFR41/YTDGxujsDNqPPIibJFQFpFD/Dy6A/4=;
        b=jji/8SC3kvZ6rZYq63a1grYQtBhnLz7GysxURkY9frWfy1FVeZHXAqpkGgFaSE/AHb
         AEld/B8lQwCRFdBpPWanWSgpdIZgbJlYvpu3Hq1Vx0evU9wNsbFoknhqLcPpbYkVDFfr
         5C7SKAqIJDcUKRkZAn9VWqFAw/IVO9IozS/EQlirxrZT8em49G0EBFWvlrN6H330h/k5
         mzHZ8Z6zJscsyg1XlWFkY5ewC70D7gTPFbW6puvhFFfKPmYoJSj3FLIrBz9DWNtpvp8e
         D+lkWvqwd7S81xudgCbruiuG4xcA2vDPc1JTuqkR+8eBHZKXeU39Wb0dHeNStZ1ofJFO
         KW1Q==
X-Gm-Message-State: APjAAAUZMWuJ6Nlf+jKr2zpyS7fAMxienWEB7L+3Rtbprf8PPN3Xf+j8
        3+N+EIzsexZ7DeV2CUTZrAgrTY6sxnGxmHdrIYgi5zY2YCmNDNlpSSZJUNhHT8poRrxymvog3cC
        Anu63K9MS/KeIDXUZOuYi
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr4191594wmc.113.1570543164502;
        Tue, 08 Oct 2019 06:59:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/ERWE2a7LeeUzH669s6gkhiIQR4L5acbyEE0C/SYoSNlPe3yG5pUJi6avFFO5sObnyGJbsw==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr4191579wmc.113.1570543164352;
        Tue, 08 Oct 2019 06:59:24 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id w9sm30461210wrt.62.2019.10.08.06.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 06:59:23 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] extcon: axp288: Move to swnodes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20191008122600.22340-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8120fbf2-08d3-6ee2-21bf-458a4e12b29c@redhat.com>
Date:   Tue, 8 Oct 2019 15:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191008122600.22340-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
X-MC-Unique: -whFVIG8O_aJzVORDOMv9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 08-10-2019 14:25, Heikki Krogerus wrote:
> Hi Hans,
>=20
> Fixed the compiler warning in this version. No other changes.
>=20
> The original cover letter:
>=20
> That AXP288 extcon driver is the last that uses build-in connection
> description. I'm replacing it with a code that finds the role mux
> software node instead.
>=20
> I'm proposing also here a little helper
> usb_role_switch_find_by_fwnode() that uses
> class_find_device_by_fwnode() to find the role switches.

Both patches look good to me and I can confirm that things still
work as they should on a CHT device with an AXP288 PMIC, so for both:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



p.s.

I guess this means we can remove the build-in connection (
device_connection_add / remove) stuff now?

