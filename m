Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9667252831
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 09:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgHZHIe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 03:08:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33959 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgHZHIe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 03:08:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id y2so1131199ljc.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 00:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2v5PP8enMhEdZFBZkq5QIgl3FCul6ZMfrOVzruei/Ko=;
        b=BCdAWR/TrwQNLeHpD1jio+3NJl9ZUYqRhg8cEyOyVeA5DQVkEu5oJ3jDofQ/iYaz/W
         je/9f0PqzeUc8kZtZM7AKNoUwCKJN3fzVujk7tRXC2mNd9mNIkdkZeCt0lap3Z2dotWG
         hTRs/mmM0u3d5dckuVtFdiDEpTjniB0Oz3Be/4PR+bjWCEFEulHPcaE7c9f+TDQxz24Q
         ZZeAt/BENUpFl+hlHJuGScsNUoiX4ygjmQKMpzKOWUYWhoVWMOBEA5I5chT+STHsBHHN
         NCQWgEdegE+WqX5ZZ9q/uXzqvwFCcsbEP+oVBy3i4RULBbdu8UPZt3jiq4eEtKhH0C9h
         Pbvg==
X-Gm-Message-State: AOAM530W4XqwC7iAAWj17eXFk6+cJDhhHuGO+h7CocAizczUICRC3aQt
        IMXXcEoF7VcoJ3A3UXwB7alG+DiPABCerg==
X-Google-Smtp-Source: ABdhPJxnaHETmwL25H07CrYy5K3l9FJ0tts6dsnV4u/WKDpn8WkRXXAcsEyL4cmNRAqWgWQr/vo69Q==
X-Received: by 2002:a2e:8997:: with SMTP id c23mr6125588lji.150.1598425711913;
        Wed, 26 Aug 2020 00:08:31 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 64sm345012lfi.13.2020.08.26.00.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 00:08:31 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kApXn-0005EE-Lz; Wed, 26 Aug 2020 09:08:28 +0200
Date:   Wed, 26 Aug 2020 09:08:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208959] USB-serial (mct_u232): bit7=1 when tty is set to
 cs7?
Message-ID: <20200826070827.GK21288@localhost>
References: <bug-208959-208809@https.bugzilla.kernel.org/>
 <bug-208959-208809-yuyUa8mpVo@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208959-208809-yuyUa8mpVo@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 25, 2020 at 03:20:48PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208959
> 
> --- Comment #2 from mslade@epic-code.com.au (mslade@epic-code.com.au) ---
> Please clarify what you mean by "converter" here.

I was referring to the USB-serial device.

> FYI to test I was just doing this:
> 
> # stty -F /dev/ttyUSB0 1200 cs7

What is the output of "stty -a -F /dev/ttyUSB0" after this?

> # dd if=/dev/ttyUSB0 bs=1|hd

Try using a terminal program instead and connect the device to another
USB-serial device (e.g. ftdi or pl2303) and see if you can get 7-bit
words to work.

You can also try enabling debugging and provide the relevant bits from
dmesg when you connect, configure and read from the device:

	echo module mct_u232 +p > /sys/kernel/debug/dynamic_debug/control

Johan
