Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0E32B0AEC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 18:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgKLRFk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 12:05:40 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:47089 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgKLRFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 12:05:40 -0500
Received: (qmail 20323 invoked by uid 484); 12 Nov 2020 17:05:37 -0000
X-Qmail-Scanner-Diagnostics: from ppp-82-135-76-196.dynamic.mnet-online.de by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(82.135.76.196):. 
 Processed in 0.406658 secs); 12 Nov 2020 17:05:37 -0000
Received: from ppp-82-135-76-196.dynamic.mnet-online.de (HELO ingxiaomi.fritz.box) (Authenticated_SSL:irohloff@[82.135.76.196])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 12 Nov 2020 17:05:36 -0000
Date:   Thu, 12 Nov 2020 18:05:35 +0100
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] usb: gadget: User space URBs for FunctionFS
Message-ID: <20201112180528.33bbe44c@ingxiaomi.fritz.box>
In-Reply-To: <X6wwNo5ZYYugyHu7@kroah.com>
References: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
        <X6wwNo5ZYYugyHu7@kroah.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Greg,

After writing this response: 
I want to redo some parts of the patch, so please ignore the current
version.
I feel that what I did is not extensible enough.

I still want to know if you think, if it makes sense at all to publish
any of that.


On Wed, 11 Nov 2020 19:40:54 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Nov 11, 2020 at 06:07:16PM +0100, Ingo Rohloff wrote:
> ...
> > I now implement two new ioctls for FunctionFS:
> >   FUNCTIONFS_SUBMITBULKURB
> >   FUNCTIONFS_REAPBULKURB
> > which provide simliar functionality.
> > 
> > A similar functionality is already implemented via AIO. But: To use
> > this API, your user space environment needs to know how to use
> > these system calls.  

OK I now understand why I was confused myself:
I was looking into the POSIX AIO functions ("man 7 aio").
At least in the C library which I use, the implementation of
POSIX AIO does not use the native Linux system calls.
What I meant above was: This C library does not know about the native
Linux system calls.

Now because of your comment I learned about "libaio", which uses the
Linux native system calls.

The first problem here: Where do you get this library from ?
At the end I got it from here:
  https://pagure.io/libaio 
  version 0.3.111
I am still not sure if this is the right place, because at least
Debian provides a 0.3.112 version, which seems to use an extra
system call (io_pgetevents); no clue if I should use the Debian
version or not.

Of course you could call the system calls directly (without using
libaio), but that's even worse I think.

> 
> So instead you created a new interface which requires different system
> calls?
> 

I created a new interface which uses the old IOCTL system call,
by extending it.
Of course the C library I use knows how to do an IOCTL system call;
which means I do not need another library (like "libaio") and extra
knowledge about other system calls.

Granted: Adding new IOCTL codes is very similar to adding new
system calls, but at least I understand the interface here.
In contrast: It was not exactly easy to get my hands on "libaio".
The fact that there seem to exist different versions of this library,
which employ different system calls also does not make me feel very
comfortable.

> Doing it in a different way is "interesting", but you are duplicating
> existing functionality here.  What is wrong with the AIO interface
> that we currently have that keeps you from using it, other than it
> being "different" than some other user/kernel interfaces that people
> are familiar with?

The first problem was: I did not know about "libaio" :)

But there is more: The existing AIO interface, does not give you the
amount of control over USB transactions which I want.

Example: I want to send 8192 bytes   USB Device -> USB Host

Because this should resemble one USB Transaction,
I want to add a Zero Length Packet at the end.

How would I do that via the AIO interface ?

Another example of this kind of missing control can be found in
comments in "f_fs.c":

   /*
    * Dear user space developer!
    *
    * TL;DR: To stop getting below error message in your kernel ...

so this tells you, you need to be aware of some USB specific quirks,
when using AIO together with FunctionFS.
I much rather want to use an interface which already is specific for
USB instead of using a generic interface (AIO), which then exhibits 
USB specific quirks.
I want to be able to get as close to the USB layer as possible with 
user space; AIO adds another abstraction layer between user space and
USB, which in turn means I loose some of the control over USB.

There are more FunctionFS AIO quirks, which I don't like at all:
Here is some output of a slightly patched 
  <linux kernel>/tools/usb/ffs-aio-example/simple/device_app
test application using libaio in conjunction with FuncionFS:

// cable connected and host test application started:
  submit: out
  ev=in; ret=8192   // ret := struct ioevent.res
  submit: in
  ev=out; ret=8192
  submit: out
// cable disconnected
  Event DISABLE  

// The submitted AIOs are not cancelled ?

// cable connected again
  Event ENABLE   
  ev=in; ret=-108  // -ESHUTDOWN from  struct ioevent.res
  ev=out; ret=-108
  submit: in
  submit: out

As you can see from above: The AIO completes with an "-ESHUTDOWN"
error, once you *reconnect* the cable (not after the disconnect).
I think this is the wrong point of time.


This also is another example, why I don't like using a generic
interface (AIO) for triggering USB specific operations:
The "ret" output above comes from a "struct ioevent.res" member;
I guess this is completely specific for FuncionFS. 
This "res" member seems to convey length information (how much 
was actually transferred) plus status/error information when it 
is negative.
If I get this correctly normal AIO operations are not supposed to
complete prematurely ? 
"prematurely": I mean transferring less than the specified length.
Maybe I just don't understand the libaio interface well enough.

> > ...
> > Via this mechanism a user space program can keep precise track,
> > which URBs succeeded and which URBs failed.  
> 
> So, it implements AIO in a different way?

Yes and No:
It does not exhibit the behavior described above.
When the cable gets disconnected, the URBs will complete with
a status which tells you the cable was disconnected.

I find it much clearer to have *specific* URB struct members called
"status" and "actual_length", than accessing a *generic* "struct
ioevent.res" member, which only seems to have this particular meaning
for FunctionFS file descriptors.

To implement 
  <linux kernel>/tools/usb/ffs-aio-example/simple/device_app
it seems you also need "eventfd" to be able to use "poll";
so this adds yet another layer of complexity.

Using an IOCTL call, you get direct control over USB transactions.
So you are much closer to the USB layer than if you are using AIO.
This means you can easily extend the functionality to support 
USB/FunctionFS specific things:

> > The final goal here is to be able to directly let user space
> > provide data buffers (via mmap I guess), which are then transferred
> > via USB; but this is the next step.  
> 
> Isn't that kind of what the AIO inteface provides today?  :)

I think my explanation was not clear at all:
What I want to have is a "zero copy" transfer.
As far as I know, "devio.c" already has that for the USB host side:
User space is able to "mmap" access to coherent DMA buffers.
When you then pass the URB to "devio.c" no copying is going on at all;
the "mmap" buffers are directly used as data buffers for the USB host
controller; at least that's what I understood from the "devio.c" code.
(In "devio.c" you need to grep "as->usbm" to find the code.)

The FunctionFS AIO does copy user data to/from kernel buffers.
I want to be able to *completely* get rid of these copy operations.

Why: Because I want to be able to provide >400MB/s to a PC,
when using USB SuperSpeed; each copy operation hurts here.

so long
  Ingo
