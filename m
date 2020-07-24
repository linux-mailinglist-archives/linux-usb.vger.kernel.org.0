Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F200822CCB1
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXR5U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGXR5T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:57:19 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7858C0619D3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 10:57:18 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s9so10812951ljm.11
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IiecWBlpeMlAossAeTVkpEy+x6lMeCVx/nxrNqdqeZc=;
        b=mHez2R2jxMcoe6mE97j/+jcOIPrrwsVSOushhmLEdoRpAbaf/RBGnViTsj5rMNCzGJ
         Jskcv3gNCQ5mYb+OBej/959aezBi1HsDljsHxkGlIkanXX6YEGjojlIN92Cf/DQaWFXG
         owt6Vm5lBzTtuH5iO03KRXaVq1Ufg5+JFzbtcA9AS2NBTAIEz7JM7DnOLWMboRH903JM
         ezxR8z8B52Ld46OyVHGtGShn7XKhtiMMYG4T/MBCWaMCsNjb8IDfnToUPfa9VWahAxsw
         DmPmAZlB1Tn9NDg7ZWMxbYiT033bI6qCG6wGN1ArwoUct6CSLPqjBaJabKnKZWm8JoUn
         +ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IiecWBlpeMlAossAeTVkpEy+x6lMeCVx/nxrNqdqeZc=;
        b=du5LWUcne5jT42NgWyANWYbh6qIZxEK+dEQEBjIOL/HZsonUwcmlFIsNiReIvNXhPS
         iOBN6WCtACpeHXzPLj0qMpZ4KVYMscfvUmGdya+/GbaMxOlphz5PkD+Y0N/apOZdCI6j
         5CtUnDVFVEVHwXoXE+gVeNCKgPCeXYDAIcPX8Q7Tth9ap3I0ynwzWAOZ5KZ2DPmc7Dqn
         zdOHfYWw8SmiL1ZAkjE/sEPm22lrNFIIJQNxmeicSQuf8KUx+ZZUDJq/jq4+31MXtQu4
         eakaHf8sqi2elMgh4/mPJ94FOo2AmlM0xK9HCYY806qVkLLIKu/5B8liEXsJ9CLu8Rji
         iz8w==
X-Gm-Message-State: AOAM530dmetiFPDAD5+WeCVVSGCh4kcZ8JipXy1Bd7CG3KmEC2tLSNuh
        cCRAuPIH4RaCO/Hp3RhDtIBoRyCPGxE=
X-Google-Smtp-Source: ABdhPJwpSPvzYNVmLmAiBejPBMKboCvvDrV82VZ5U+LH27iD5brEkAstgh6BeFrAqn1v2xvzQLMcOQ==
X-Received: by 2002:a2e:88d0:: with SMTP id a16mr5063651ljk.213.1595613436764;
        Fri, 24 Jul 2020 10:57:16 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:80f:eec9:9f1f:2e41:78b8:6474])
        by smtp.gmail.com with ESMTPSA id m20sm399827lfb.72.2020.07.24.10.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 10:57:16 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] usb: typec: tcpm: Add WARN_ON ensure we are not
 trying to send 2 VDM packets at the same time
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-6-hdegoede@redhat.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <41ecf2f2-33c4-466a-ee42-37d1a3ccbb7f@gmail.com>
Date:   Fri, 24 Jul 2020 20:57:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724174702.61754-6-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello.

On 7/24/20 8:47 PM, Hans de Goede wrote:

> The tcpm.c code for sending VDMs assumes that there will only be one VDM
> in flight at the time. The "queue" used by tcpm_queue_vdm is only 1 entry
> deep.
> 
> This assumes that the higher layers (tcpm state-machine and alt-mode
> drivers) ensure that queuing a new VDM before the old one has been
> completely send (or it timed out) add a WARN_ON to check for this.

   Sent?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Fix typo in commit-msg subject

  Another typo? :-)

[...]

MBR, Sergei
