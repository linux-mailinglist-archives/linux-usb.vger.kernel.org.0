Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA044A3E62
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 08:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237459AbiAaHzn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 02:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234839AbiAaHzl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 02:55:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F62EC061714
        for <linux-usb@vger.kernel.org>; Sun, 30 Jan 2022 23:55:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 334C5B8279A
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 07:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4536C340E8;
        Mon, 31 Jan 2022 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643615736;
        bh=NxyrW7fRgG1Bg/vVAeHCBH6ZL9dky7+z2y4TSsX1cHw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SZGr8gJbi4/jj+8nYnSY31iufxm20D3tOy2K2lCBTPuVaE3iZgTKmy9aKDLnBhK15
         Iy5iRR2XXP2vER8TmuPwfiVoMN7WBSeKdB1Sfg2DLio/8nrMooaFppdHlrdU2QwFgO
         pi+7VwtsT8mN5Q0C94Z/SzYwJ4ZZ64whn3J+8ksFnEHVrDICUhzQTdQoz1s+AKqr+5
         V8cbdf2kJGv6zLCPxOVCI8xTvZxtjk3UhFr2SrVfSsZ/Uw+ZoBxGXrrmkOVsDYO+KJ
         7dQej7pSIebeXPV8/zm5O6axRfAau87DhHo5s5V4Q0xvqCrMADUFi3/7mQvgF8KcxT
         PwqnWX7TmbTJg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nERWz-0001gd-Ft; Mon, 31 Jan 2022 08:55:21 +0100
Date:   Mon, 31 Jan 2022 08:55:21 +0100
From:   Johan Hovold <johan@kernel.org>
To:     "embedded (VIVAVIS AG)" <embedded@vivavis.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ftdi_sio: Problem when changing the baud rate after a transfer
Message-ID: <YfeV6f6hnz7Cgrt/@hovoldconsulting.com>
References: <5aae37a8029549d8a9ef28f2e39fe58f@vivavis.com>
 <1ec54d4f592c46b7a14109df559072e4@vivavis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ec54d4f592c46b7a14109df559072e4@vivavis.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please wrap your lines at 72 column or so. I've tried to reflow you mail
below.

On Fri, Jan 28, 2022 at 10:09:26AM +0000, embedded (VIVAVIS AG) wrote:
> > Gesendet: Montag, 10. Januar 2022 14:27
> > An: linux-usb@vger.kernel.org
> > Betreff: ftdi_sio: Problem when changing the baud rate after a transfer
> >
> > Hi,
> > there seems to be a problem with the ftdi_sio driver in conjunction
> > with an FT2232C and changing the baud rate.
> > This behavior is observable at least on linux 4.19.190.

You need to reproduce any issues you have with a more recent kernel such
as 5.16.

> > The following was done in order to observe this problem:
> > A transfer is started over one of the serial interfaces of the
> > FT2232C at a lower baud rate, eg. 300 baud.
> > The code waits for the driver to empty the tx buffer by calling
> > tcdrain(). After the call returns the code changes
> > the baud rate of the serial interface to a higher rate, eg. 4800
> > baud, and writes another stream of bytes.
> > Now the problem occurs: Looking at the TX pin of the used interface
> > with an oscilloscope, one can see that the last byte of the previous
> > transfer, which is supposed to be transferred at 300 baud, is
> > transferred at the higher rate of 4800 baud. Even worse, it is not
> > even the complete byte, but rather some of the last bits of that
> > last byte which are transferred at the new baud rate configured.
> > This problem occurs independent of whether the interface is opened
> > in blocking or non-blocking mode.
> > I verified that the driver does in fact ask the hardware if it's tx
> > buffer is empty when the hardware status is reported.

How exactly did you verify that?

> > However, it seems that the reported status by the FT2232C does not
> > check the status of it's shift register (if that is even possible at
> > all), which is clearly influenced by the changed baud rate.

If it really is a hardware issue, then it's not much we can do, but see
below first.

> > Can someone confirm this behavior and is there a proper way to fix it?
> >
> > Regards,
> > Yasin Morsli
> >
> >
> > PS: Here is an MWE to test this behavior:
> >
> > #include <stdio.h>
> > #include <fcntl.h>
> > #include <string.h>
> > #include <termios.h>
> >
> > const char* help_msg =
> >    "Usage: %s [tty] [data]\n"
> >    "  tty:  filepath to the tty\n"
> >    "  data: data to transfer\n";
> >
> > int error(const char* msg) {
> >    printf("Error: %s\n", msg);
> >    return -1;
> >}
> >
> >int setspeed(int fd_tty, int speed) {
> >   struct termios tty;
> >    if (tcgetattr(fd_tty, &tty) != 0) return error("tcgetattr failed");
> >
> >    cfsetospeed(&tty, speed);
> >    cfsetispeed(&tty, speed);
> >
> >    if (tcsetattr(fd_tty, TCSANOW, &tty) != 0) return error("tcsetattr failed");

Unless you use TCSADRAIN (or TCSAFLUSH) the driver is not supposed to
wait for the outgoing buffer to drain.

Please confirm if changing this fixes the problem you're seeing.

> >
> >    return 0;
> >}
> >
> >int main(int argc, const char** argv) {
> >    if (argc < 3) {
> >        printf(help_msg, argv[0]);
> >        return 0;
> >    }
> >
> >    const char* path_tty = argv[1];
> >    const char* data_tty = argv[2];
> >
> >    int fd_tty = open(path_tty, O_RDWR | O_NOCTTY);
> >    if (fd_tty < 0) return error("open failed");
> >
> >    struct termios tty;
> >    if (tcgetattr(fd_tty, &tty) != 0) return error("tcgetattr failed");
> >
> >    tty.c_cflag &= ~(CSIZE  | PARENB | CRTSCTS);
> >    tty.c_cflag |=  (CS7 | CSTOPB);
> >    tty.c_iflag &= ~(IXON | IXOFF | IXANY | IGNBRK);
> >    tty.c_lflag = 0;
> >    tty.c_oflag = 0;
> >    tty.c_cc[VMIN] = 0;
> >
> >    if (tcsetattr(fd_tty, TCSANOW, &tty) != 0) return error("tcsetattr failed");
> >
> >    if (setspeed(fd_tty, B300) != 0) return error("setspeed failed");
> >    write(fd_tty, data_tty, strlen(data_tty));
> >    tcdrain(fd_tty);
> >
> >    if (setspeed(fd_tty, B4800) != 0) return error("setspeed failed");
> >    write(fd_tty, data_tty, strlen(data_tty));
> >    tcdrain(fd_tty);
> >
> >    close(fd_tty);
> >
> >    return 0;
> >}
> 
> I've found this older thread
> https://www.spinics.net/lists/linux-usb/msg71689.html.  The proposed
> solution or patch with chars_in_buffer() function doesn't exist in
> more recent kernels (4.19 or newer), but the same functionality is
> achieved by ftdi_tx_empty(), which is indeed called, when tcdrain() is
> called from userspace.  ftdi_tx_empty() calls ftdi_get_modem_status()
> and checks whether FTDI_RS_TEMPT flag is set. If set (i.e. shift
> register empty) ftdi_tx_empty() returns true.
> 
> But I wonder why FTDI_RS_THRE (transmit holding register empty) is not
> taken into account.  Furthermore, I can not find any checks for
> tx-fifos. But possibly the FTDI chip has a guarantee that if
> FTDI_RS_TEMPT is set, the holding register and internal tx-fifos are
> empty, too.

That's the way it's supposed to work, yes (i.e. FTDI_RS_TEMPT implies
FTDI_RS_THRE). 

> As Yasin stated above, it can be observed that the chip transmits
> data, even if the driver reports ftdi_tx_empty() == true. Possibly due
> to a bug in the driver or by poor chip design.
> 
> Any thoughts on this?

Please try using TCSADRAIN first.

Johan
