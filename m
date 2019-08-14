Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD938D52F
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 15:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfHNNmu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 09:42:50 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37828 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbfHNNmu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 09:42:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id f22so7119807edt.4
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 06:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0HsquNrNKiMbr5FDDummx4kovw9WYQfo6fm7gr2n+lo=;
        b=OIgvi78myB7p0tJHpE1rOR1xt5ncnz4IK9xF3HE/aB8SWpRzwqLd8LFdkM9W6lTiTg
         V+Lby0sTSesMRULn2uU/K8xq45kSY/J9PpahFTC5EQkcmtrMKLrIh6UTtQRaiUNf+h0+
         t1A+Bar42/XfZhzTLbhsinNFHLpDZ2RrS8EZmtGiUpi+M38op8lqsIBnfRRPXWLLVvzz
         UZpW99NBqmsEoXxDlCBsD6BxBQEj5djjoYevT0X+ADH6CFIhHCnA8X/BmAs6NZMS8/Ra
         MX5ovEAEo1pgJf1CiCXmtrRmRT9BV/AH3Omx7OOy2CPx1B8pXhGx37mLVqgqLAOHfqwu
         Sijg==
X-Gm-Message-State: APjAAAUuV/xZPBDpNWAdhKf5BQOkpzaZIDXx+KLtlbblYPx1s8qNzBxh
        jhgZHKnRnk1lC426THUzZKT+IQ==
X-Google-Smtp-Source: APXvYqzgD7tzSUMCupou4DFUUVf0PmPBWuMVp7BchUmB9yHfjojZwOpuIr/o4daHA3x/qYTDpeyDuw==
X-Received: by 2002:a50:b3cb:: with SMTP id t11mr27650559edd.203.1565790168489;
        Wed, 14 Aug 2019 06:42:48 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id b40sm4231311edc.53.2019.08.14.06.42.47
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 06:42:47 -0700 (PDT)
Subject: Re: [PATCH 0/3] usb: typec: fusb302: Small changes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190814132419.39759-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a826c351-4e9d-8a33-ad0f-764d13aeb1ed@redhat.com>
Date:   Wed, 14 Aug 2019 15:42:46 +0200
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

Series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

This has a small conflict with my
"[PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier"
patch.

Since we've agreed to do the rootdir leak fix as a separate patch
(which I will write when I find some time probably tomorrow), I
was wondering if we can merge my patch first. I would like to see
a "Cc: stable@vger.kernel.org" added to my patch and then it would
be good to have it merged first.

Regardless we should probable prepare one series with all patches
for Greg to make this easy to merge for him.

Shall I combine this series + my fix + my to be written fix into
1 series, test that on actual hardware and then post that?

Regards,

Hans
