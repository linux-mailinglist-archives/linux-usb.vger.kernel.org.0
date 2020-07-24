Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03AC022CE78
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 21:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGXTJ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 15:09:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30070 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726658AbgGXTJ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 15:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595617766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=63Qu3dIs4g7Zm/R1W02N9tyo6cVT2OjY/Lp9h662dek=;
        b=FRc63EimjBVISLsZZvNQ/iXDi5TPRoZ5HlbdGTGR0S8GBA8LDuSQU0A2v8LS/5zMjf95pf
        9/UFQ4F7PSdzcetkusP6SF4OXDcxgNF4RK5KQia8vIhikl2TwMmvc9fB8NMx/sZlVX1kxI
        q0vHwNwbH9Vf4fWZdIC0u3cQtZkXVs0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-Q71exWH-N1CMm5xPzk4zzQ-1; Fri, 24 Jul 2020 15:09:24 -0400
X-MC-Unique: Q71exWH-N1CMm5xPzk4zzQ-1
Received: by mail-wr1-f69.google.com with SMTP id w1so370350wro.4
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 12:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=63Qu3dIs4g7Zm/R1W02N9tyo6cVT2OjY/Lp9h662dek=;
        b=tER6/ANFTb3xaPaD8EvcwFQlzXlf0gc6vZMLpmXLiKhMSUerp9N7IiJvdkTluogOBU
         ASTEZ4RaonyEaX1FxVaa6lYcVZta4wgrY7QTqwUUv6+T1MNTUf7tRvRVNuue4AzLKje7
         hHv4o45SAyKaWTSuwXICVfljY05VoK7ngCNzWKBRA1oF5ntrYqCih3p/oa3UOfcu5PVq
         OzjNs36vwFfZ/tma8AxtiI40cdvtH/bu+vF1hWKFpDya1NJi3/uUpDfV6qu0yb0+J88q
         ooWgC3i7Pz1xac18zeHNmJIcV7DvWG6E8XC42fDeZq5mh2T3ry9sANQ9BRlGvDRsb5wU
         dRiw==
X-Gm-Message-State: AOAM5322GEm15WodykKa0RRecv6Fs4qdSQy6NgqxjOYaHZ5BCQo0vdWI
        1hIzJlzqqFGkr2FwGyjqIVk1DfekRpZd6okHABRjhbOGs/WpHxCX0Oa0doksaGK8V2UVj3GPKo8
        NvUPZxF6aYcVjlcLTByra
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr9601786wmi.19.1595617763248;
        Fri, 24 Jul 2020 12:09:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy176+Pj+OUy+vYqCiaK0I1RW4D9cUNBAtyMKabrfPuNPdPCj7K+fHx9WHrYtrewQKUuv6v7A==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr9601779wmi.19.1595617763044;
        Fri, 24 Jul 2020 12:09:23 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id s205sm2312556wme.7.2020.07.24.12.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 12:09:22 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] usb: typec: tcpm: Add WARN_ON ensure we are not
 trying to send 2 VDM packets at the same time
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-6-hdegoede@redhat.com>
 <41ecf2f2-33c4-466a-ee42-37d1a3ccbb7f@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f0246d15-02a5-3bd0-9612-6dd0b231d56b@redhat.com>
Date:   Fri, 24 Jul 2020 21:09:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <41ecf2f2-33c4-466a-ee42-37d1a3ccbb7f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/24/20 7:57 PM, Sergei Shtylyov wrote:
> Hello.
> 
> On 7/24/20 8:47 PM, Hans de Goede wrote:
> 
>> The tcpm.c code for sending VDMs assumes that there will only be one VDM
>> in flight at the time. The "queue" used by tcpm_queue_vdm is only 1 entry
>> deep.
>>
>> This assumes that the higher layers (tcpm state-machine and alt-mode
>> drivers) ensure that queuing a new VDM before the old one has been
>> completely send (or it timed out) add a WARN_ON to check for this.
> 
>     Sent?

The dictionary says "has been sending" and gives no "has been sen[d|t]"
answer. I guess you might be right. Anyways not worth respinning
the series for IMHO.

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Fix typo in commit-msg subject
> 
>    Another typo? :-)
> 
> [...]
> 
> MBR, Sergei
> 

