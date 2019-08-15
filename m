Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBF08F222
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 19:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbfHOR0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 13:26:46 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39287 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbfHOR0p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 13:26:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id t16so2893495wra.6
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 10:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y4+EC3K/OraoQekA4qFzE8BLaZwE6owYXq+qixqnFME=;
        b=bllz292Fv+Lyfv0WRRZvxgVDbRGc4yCE27LP1a/QC1BYnak1TlaCXOWjOXyRP6a1aI
         hALSLQcFl+gwYB1eaP5A1XPt1QqMala4WG29HL0Kh7LdOf8yV9G7OYiC9ZxVf2DlpVQ1
         ixuh6Wm1IfrQ5MkDKVIBNIfe+uXJOZAeSAQ4reau4/gE/gCoPjXWgJbSu85WCGNNKrGl
         gb/mj96Me++FHaOhsoi55qeD70ObtQZFupilQUzceYt3AcUOTX7hZ0mh5buBVYp2byu2
         1S51AKMSyAdL8/hnXmUd1ojnPmtbN0A8Bo+QT3Uhal0AQwGEDQKmWhQ9UHTw8N5rvuF2
         HpNw==
X-Gm-Message-State: APjAAAUDIAPpYJixUmAINxuifOfLsan8xO3QpShAXlGByLn7Qz13cNsS
        kN9z80z29G4Dk7/QkXQ0kfa38Q==
X-Google-Smtp-Source: APXvYqyYPY95uK6vTb/hFt+RKFB9Pmf6Bnhkb5VvVPjrB+VctenX0bTjjplB0OYB7X8RzuIEBe/oLQ==
X-Received: by 2002:adf:9e09:: with SMTP id u9mr6614069wre.169.1565890003935;
        Thu, 15 Aug 2019 10:26:43 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id o14sm3642773wrg.64.2019.08.15.10.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 10:26:43 -0700 (PDT)
Subject: Re: [PATCH 0/3] usb: typec: fusb302: Small changes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190814132419.39759-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4a97653f-9222-9cbd-1944-e5192775bcb1@redhat.com>
Date:   Thu, 15 Aug 2019 19:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814132419.39759-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 14-08-19 15:24, Heikki Krogerus wrote:
> Hi,
> 
> This series removes the deprecated fusb302 specific properties, and
> stops using struct tcpc_config in the driver.
> 
> thanks,
> 
> Heikki Krogerus (3):
>    usb: typec: fusb302: Remove unused properties
>    dt-bindings: usb: fusb302: Remove deprecated properties
>    usb: typec: fusb302: Always provide fwnode for the port

I know this series is already in usb-testing, still I thought
it would be a good idea to test it on my CHT hw with a fusb302
TypeC controller. So I've just completed testing this and it
works as advertised:

So FWIW:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

