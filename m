Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F847795F
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2019 17:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbfG0PFU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jul 2019 11:05:20 -0400
Received: from sonic306-23.consmr.mail.gq1.yahoo.com ([98.137.68.86]:37488
        "EHLO sonic306-23.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726370AbfG0PFU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Jul 2019 11:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bellsouth.net; s=s2048; t=1564239919; bh=KZsfHOP/BA7epzqxxZTuePfuF83Q1YzB+f1jx0Q2mfI=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=AwvfatpIiqEhRjFK56FioH8IqVtFKZmF6VGL0WNmilF+xs9arFIdqElO+4dv1zob2vGSZpXgIuSSjiHdEiM4WQ6/zKU0j6iIO6ynrlwU+g0x0o9cBr3MFkU8wHqdX+Im/M/h9xzNXu3oM2kZAfJh/ksmQXcg2qvFEsoLowtoAcsLaSrIT3hrFzOFdBOPT5WSxmrsjd0m7nQ8V3lL0gIiD4oS1m0OG/Yd/dHf1I0tIq9sB9oSrmJqCGbWExjeVLIO0rML/vSjEkcCEAEiRyTT9TNqxTC8QhTMSRUKH5aOusey+SyQj9GbqEqGq8OSNI3Fc8w+ILci9hgsGUhDHxNiUA==
X-YMail-OSG: ehyC_6sVM1lRvLETXUtMVV.Ff1Pp41xLLtjB9TmVC0wG5F2w6GlfjiDX5WoI0Wr
 fh4VNWXkWj.ax6Fvq7GZtPCecZleNJDajBkSGznLaA6nPHqJnigZ93w0lsC5fZ.uLzRKR4GZsAda
 _9V5fFAMEimAA47TuMo28K.u.AT5XgLT8abFMB1K4u3byL3inJkHTX4.60FjwBW9ks_9oVPbZc.S
 phTHmwE80lnCVsOff.TMXSvIuqlVlvpuIfNjxFjdMowA3XBfv0lhyMO80bCvIqbW3PDhO3CSrK30
 AzMx6G0rtXPYKgo4F1ERp3QSZFm.Z7jf9K8maeWmLwqLgUbALDIFOY_r7YLhPQ6WnRh24nM7Fu1I
 918XBwbfB3vKZ2EzuFtcLJ7TD3MNNyjW1wkcoQY6KAcMBssrlnFmsVgA8Xerf5v4r8KvzXLu5R9b
 ionuVBPlYr3dK0K1nHQu.mOnZ.BhsCi8PwxV2vOxkM99rQT1s7Yu0LEWISAqZw9j5FIYfo228B1N
 uUqy275T3c2bLP5TWTw0hr8e9vpiEpvVa0UuY0sk44qd.TR7zvrjfB1JCe1oeZ09R_My8Q.6OYp9
 SUmuOHz.8i5pxZHSP_0yKpKKNCgguEHjYU82cfVrsqKxYCz_2ZtwV2i2Mz1sKAp6HKi1BKt4TjLE
 r3BKTU6ICJRz1XmephGQsX9Om4ah4VMNUt8.f9hlWwNLz_XOTKDr7FJ_zrOMhG5syC91N317GC99
 tV9wduoNZUUpyEMpeVc.8G5CKevzUWRJ3TaqDr53ItsJtUbwn83wOsgFGv7qOB7tpobIV2dKKoX7
 VtR8HC9BNKyUeI35rBdF0JLYdQobINXF4..RS3LxU6r.KnqK92ZzFxSrNNmwo5y0hE1epw0dNkBB
 iQxP_tUAe9zwqmodv6XHoFcOgAcwzemVQIPJu22t2LZ.6tvj_olDkEQwPR4BBaPrSdMg2Gdii0mj
 PJt8jAHVNOG_WSb6dW_AgXpr3TVN1lzLJaVG_O9XT6nYtIcQHccL1b2iZY_dvngZFHpqspBDJ7Fj
 OOhq8V192MF0hX9tiLqKNW9RWRIDjUdPOPHVgBNt_KYetYvp2w5cbHG4HvhY8.1j7VkOVcWzlZ47
 p90mJc7HakvS2QpVYPu0pgQ7L68Qp1PUdQlg2z7sg9JGyfipffZWNw7xntQcpUPZ2O1K5IhbPQHM
 1OvPO4kA7R6d209iHy4jsLrxIlg.O3uyQ.dHh3koQh.5hAHEEsqHt3fmNPhSeiz5paAh7_AgR
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.gq1.yahoo.com with HTTP; Sat, 27 Jul 2019 15:05:19 +0000
Received: by smtp421.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 3db7d607082dc8bb73edfaeb7b004fc6;
          Sat, 27 Jul 2019 15:05:16 +0000 (UTC)
Subject: Re: Oops in xhci_endpoint_reset
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com>
From:   Bob Gleitsmann <rjgleits@bellsouth.net>
Message-ID: <f7b5872a-ad30-453a-c9d7-b9fd649b6eb8@bellsouth.net>
Date:   Sat, 27 Jul 2019 11:05:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190727105955.GE458@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm working on it,.

On 7/27/19 6:59 AM, Greg KH wrote:
> On Fri, Jul 26, 2019 at 11:15:46PM -0400, Bob Gleitsmann wrote:
>> Hello,
>>
>>
>> I have seen kernel oopses on waking from suspend to memory. I got this
>> twice, one dmesg with backtrace attached. The other one had the failure
>> in the same place in the code.
>>
>>
>> This is kernel 5.3.0-rc1, patched for another problem in ethernet PHY
>> driver. Have not had the problem with earlier kernels. Using Gentoo
>> linux, amd64, but git kernel.
> Any chance you can run 'git bisect' to track down the offending commit?
>
> thanks,
>
> greg k-h
>
