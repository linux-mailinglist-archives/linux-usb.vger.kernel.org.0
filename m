Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663444897A7
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 12:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244812AbiAJLk0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 06:40:26 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41377 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244951AbiAJLie (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 06:38:34 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 937DB5C0105;
        Mon, 10 Jan 2022 06:38:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 10 Jan 2022 06:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=a
        K4KlOCM4/0R3UruZECYI3IK0k5YR1+Baiw5oG9cmVk=; b=OQ7F7BosMyi4/CzED
        ApvwaTm0JysgFIPV6fI5W/7U4p1D9cpLvWwt61W2lhHXN05o7VZHJFstPM+rUD8U
        2NIN7yryjKhfXAGMRRGq28GFElXe+NkS7BMgU/NBx6E0gh4jRPpO9MDHAt79zYDB
        kWi8zmlbpunLGaKzadfCvNrVoGzXCxLnnRNv+w/gIdzMgagNk6nLSMRXlQePCo9A
        IuaXkQiS5hNasi05mnJi2AuHiQ8LjCuVwCJTsJF004m3qZWhRO4uxTXF5IenuofT
        47oICyoBpLlXBF8wkgXsrp8TPhyo9qyqsTPf4/yL9MnpiQb/YLkRDfdBiu2nYz8U
        cXYQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=aK4KlOCM4/0R3UruZECYI3IK0k5YR1+Baiw5oG9cm
        Vk=; b=ReFJNkz3Mdh2xtNf8EVp4zs+SJa8ip2cWHdf85yVayiJCcFbfQY6oP5M2
        29Wjucj2k63GZsiDe7kfSQ5UATUgxYHlP8MNGsmIYg30TUywS21YwZHGoEBK7x8x
        1+4UGgmo+TBhAPDod1feqIv4Je8wUEobAjvySCC68je/PUH100779/nQeE0Jf0AR
        nAGnJ8eExiZlOTPnCLwT/QQjXHxZfzyyMj32HykjsPpMr9DWsSJgPg2zJMjoPzKY
        j0qDbxuUSfGnM7YcqEm5A3im52OSFi+9+3Noygm+MjCB+TgFBfdX4JxfDGLUIxoO
        xVbjiJzkbvizeSfsfaRx752PQ9iCA==
X-ME-Sender: <xms:uBrcYdOYvod8zo65yzsh3O3_Ed9oK6XSailFbsQrQD1Huul5o4EPgA>
    <xme:uBrcYf-_7i3iswX5WgnSb6pU2hF7AqvWSIetUet40Kecc081Nj-wUd9YaGKKzJ7xj
    sFrwxViCcAfoA>
X-ME-Received: <xmr:uBrcYcQxmydXEnjf7v4RUnoSqYGh2DqOnoZW4vVpyfaIcuoJxKQ6EbE95EXDccCv7nQOjZczoX3EtdrjtGtQ1I9Z3LrOUQ1L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggugfgjsehtke
    ertddttdejnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeegieejuedvffeuvdfftdetfeeuhfekhefgueffjeevte
    dtlefgueduffffteeftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:uBrcYZu0XWmZPIoxf4BMJH1-Iq0Gvqzdfko04NEJCJZqJmg0g1QUZw>
    <xmx:uBrcYVfsUDIKZy4vEU0IRJmDGDjCEOGwhhMGX5ib7xMBi3ND48oVNg>
    <xmx:uBrcYV1n5fOofOMMxzvX5NBNEFKE0A-2g3Cz2fmKBs0WHzimgETEmA>
    <xmx:uBrcYWqNlq0d3It9vU2yg87PBp9rHDx4rjhs3rldJ-Fv8agMaku-ZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jan 2022 06:38:31 -0500 (EST)
Date:   Mon, 10 Jan 2022 12:38:29 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 215475] New: RMNET data connection speed would be reduced
 to about 80-100Mb/s from 150Mb/s  if try to re-connect it
Message-ID: <YdwatYUKUG7broo4@kroah.com>
References: <bug-215475-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bug-215475-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 10, 2022 at 11:23:13AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215475
> 
>             Bug ID: 215475
>            Summary: RMNET data connection speed would be reduced to about
>                     80-100Mb/s from 150Mb/s  if try to re-connect it
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.13.0

Does this also happen on 5.16?

> Created attachment 300251
>   --> https://bugzilla.kernel.org/attachment.cgi?id=300251&action=edit
> iperf test result
> 
> We have a Qualcomm modem device which support MBIM and RMNET over USB.
>   For RMNET, the download-link speed would be reduced to 80 Mb/s if re-connect
> it once. The expected speed should be 150 Mb/s.
>   Test step as below:
>   1. Switch device to RMNET USB composition.
>   2. Connect it to host PC(kernel 5.13).
>   3. Start a data connection with nmcli related settings.
>   4. Start a iperf test with simulated network(CMW500). Test result is about
> 145 Mb/s ,and protocol is TCP.
>   5. Disconnect the connection by turning off the signal, setting AT+CFUN=0， or
> deleting the data connection in the host.
>   6. Re-connect it again.
>   7. The TCP iperf test could only reach to about 80-100Mb/s.

If you look at the usb traces, is the data the same?  Any long pauses?

thanks,

greg k-h
