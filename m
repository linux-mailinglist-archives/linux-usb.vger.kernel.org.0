Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F9696B37
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 23:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730823AbfHTVNx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 17:13:53 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:35392 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbfHTVNx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Aug 2019 17:13:53 -0400
Received: by mail-pg1-f182.google.com with SMTP id n4so31309pgv.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2019 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=COQZdiCjrrFEcVsjX6I0ZXViUiK8K/UbiYsifMm0lpQ=;
        b=hC0JAsdkBmeIWNFNGmEqP7K6ub18gh9k8irPi0ipsaSpo2Njrhbu2TNSS6iz9xkoUx
         8+vfxlezmNEJ/P1DmD1AjBrRH6Nu1r6GOxw3cV/qUT5DneI5Sq7G9JdwYlZxed6+DKS2
         ETvxGt6zDFQmPAp2B5rM8dRzOe6MJBnSX4h+BKjmk/v6rdC0mF3UCcK45nalrCpbjhiF
         gtIn8xIcRf4hi+z7kA4MNTge1cfpoxotHHMvU3oXcegbfYkAKS+npWOIA7PjNtwbuMVe
         qLKlU1DLGnbmD0ZSQphipIJKc4IN+qbHzaG7cWXQ7gXFW6siwxqVW6p2KJ8hVgG8TNrg
         v5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=COQZdiCjrrFEcVsjX6I0ZXViUiK8K/UbiYsifMm0lpQ=;
        b=iGDn6JO2kAMJU6Mf4Z+RP9FTIhRwQkRBAQTW1wFASpampgTui5VHymp9I7lNtbxJk/
         he0rgV4ccvP09YnlhyYaXLoTiLJGSGrXVzTHg4Z/WGu57R+6gWJd6iEiD363ALoUsIGK
         07BLrTX7G823gb0TDDnOo77yIgGiizduylaNWuOBoLZYX5OXSxq2Ilyzq1Sy4X/JVKl9
         OvBuGkAYAJLF5VgaXgKb5m6Ny88/qr9aNiQ49H4QoKlKcr2PIkVlLZ2mMScPd5CXo2EW
         u3sQeUPI7kk5qC5DlN5VKzHefrGimPcn7Z10b9+Z1Bb0hnh7MBG7MJTJI8xpPUMfvPnu
         SQNQ==
X-Gm-Message-State: APjAAAV78finrkSVX4kyyUllZwx/d25aYfiIlqiuC+PniS9rQ/6uCUUd
        JQEzlrJRPox9DF9bVTThUhJ7kVhkxoLq8g==
X-Google-Smtp-Source: APXvYqxN2pWdjLTCMpSWcz4etD41MHjyNMwBGq8Bot7/an/+ofeqXS2Yajq0JcfiwaEbFq09SwbeWQ==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr31790435pfa.95.1566335632670;
        Tue, 20 Aug 2019 14:13:52 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:5404:91ba:59dc:9400])
        by smtp.googlemail.com with ESMTPSA id a6sm22890774pfa.162.2019.08.20.14.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2019 14:13:52 -0700 (PDT)
Subject: Re: USB: gadget: f_midi: fixing a possible double-free in f_midi
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        "Yavuz, Tuba" <tuba@ece.ufl.edu>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        stable <stable@vger.kernel.org>, Felipe Balbi <balbi@ti.com>,
        linux-usb@vger.kernel.org
References: <20190820174516.255420-1-salyzyn@android.com>
 <20190820201515.GA20068@kroah.com>
From:   Mark Salyzyn <salyzyn@android.com>
Message-ID: <c96a0121-eb12-9449-44eb-0d2e09ccef92@android.com>
Date:   Tue, 20 Aug 2019 14:13:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820201515.GA20068@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/20/19 1:15 PM, Greg Kroah-Hartman wrote:
> No signed-off-by from you?
>
> Anyway, this is already in the 4.4.y queue and will be in the next
> release.
>
> thanks,
>
> greg k-h

Ok, thanks! I will stand down.

-- Mark

